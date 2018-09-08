const functions = require('firebase-functions');
const admin = require('firebase-admin');
const GeoFire = require('geofire');
// const serviceAccount = require('../../postnow-faa46-firebase-adminsdk-vdgtv-47284c4892.json');

// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
//   databaseURL: "https://postnow-faa46.firebaseio.com"
// });

admin.initializeApp(functions.config().firebase);

// Enable CORS (Allow ‘Access-Control-Allow-Origin’)
const cors = require('cors')({ origin: true });
const express = require('express');
const cookieParser = require('cookie-parser')();
const app = express();

const appPub = admin.database().ref('app/publisher');
const appSub = admin.database().ref('app/subscriber');

const validateFirebaseIdToken = (req, res, next) => {
  console.log('Check if request is authorized with Firebase ID token');

  if ((!req.headers.authorization || !req.headers.authorization.startsWith('Bearer ')) &&
    !(req.cookies && req.cookies.__session)) {
    console.error('No Firebase ID token was passed as a Bearer token in the Authorization header.',
      'Make sure you authorize your request by providing the following HTTP header:',
      'Authorization: Bearer <Firebase ID Token>',
      'or by passing a "__session" cookie.');
    res.status(403).send('Unauthorized');
    return;
  }

  let idToken;
  if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
    console.log('Found "Authorization" header');
    // Read the ID Token from the Authorization header.
    idToken = req.headers.authorization.split('Bearer ')[1];
  } else if (req.cookies) {
    console.log('Found "__session" cookie');
    // Read the ID Token from cookie.
    idToken = req.cookies.__session;
  } else {
    // No cookie
    res.status(403).send('Unauthorized');
    return;
  }
  admin.auth().verifyIdToken(idToken).then((decodedIdToken) => {
    console.log('ID Token correctly decoded', decodedIdToken);
    req.user = decodedIdToken;
    return next();
  }).catch((error) => {
    console.error('Error while verifying Firebase ID token:', error);
    res.status(403).send('Unauthorized');
  });
};

app.use(cors);
app.use(cookieParser);
app.use(validateFirebaseIdToken);
//Search Results
app.get('/geoFireSearch', (req, res) => {
  const lat = parseFloat(req.query.lat);
  const lng = parseFloat(req.query.lng);
  const rad = parseFloat(req.query.rad);
  const category = (req.query.category);
  const uid = (req.query.uid);
  const result = [];

  const geofirePubRef = new GeoFire(admin.database().ref('app/geofire/publisher').child(category));
  const geofireSubRef = new GeoFire(admin.database().ref('app/geofire/subscriber').child(category));

  geofirePubRef.query({
    center: [lat, lng],
    radius: rad //kilometers
  }).on('key_entered', (key, location, distance) => {
    if (key.split('!!')[0] !== uid) {
      appPub.child(key.split('!!')[0]).child(key.split('!!')[1]).on('value', (snap) =>
        result.push({ key: key, post: snap.toJSON() })
      );
    }
  });
  geofireSubRef.query({
    center: [lat, lng],
    radius: rad //kilometers
  }).on('key_entered', (key, location, distance) => {
    if (key.split('!!')[0] !== uid) {
      appSub.child(key.split('!!')[0]).child(key.split('!!')[1]).on('value', (snap) =>
        result.push({ key: key, post: snap.toJSON() })
      );
    }
  });
  res.setHeader('Content-Type', 'application/json');
  res.send(result);
});
// GeoFire Insert
app.get('/geoFireInsert', (req, res) => {
  const lat = parseFloat(req.query.lat);
  const lng = parseFloat(req.query.lng);
  const category = (req.query.category);
  const type = (req.query.type);
  const key = (req.query.key);
  const coords = [lat,lng]
  const geofireRef = new GeoFire(admin.database().ref('app/geofire').child(type).child(category));
  geofireRef.set(key,coords);
  res.send('Success');
});
// List of Categories
app.get('/listcategories', (req, res) => {
  const result = ({ categories: [{ name: "Apartment", icon: "home" }, { name: "Car", icon: "car" }, { name: "Service", icon: "tennisball" }] });
  res.setHeader('Content-Type', 'application/json');
  res.send(result);
});

exports.app = functions.https.onRequest(app);