import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/models/chat.dart';
import 'package:first_app/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/globals.dart';

final FirebaseDatabase database = new FirebaseDatabase();

class Firebase {
  String token;
  Firebase() {
    _getUser();
  }

  _getUser() async {
    await globalUser.getIdToken().then((userToken) => token=userToken);
  }

  pushData(String type, MyPost post) {
    // Push Data into Firebase
    var firebaseRef =
        database.reference().child('app').child(type).child(globalUser.uid).push();
    var key = firebaseRef.key;
    firebaseRef.set(post.toJson());
    // Push Data into Geo Fire
    var url =
        "https://us-central1-postnow-faa46.cloudfunctions.net/app/geoFireInsert";
    var body = json.encode({
      "lat": "${post.location["latitude"]}",
      "lng": "${post.location["longitude"]}",
      "category": "${post.category}",
      "type": "${post.type}",
      "key": "${globalUser.uid}!!$key"
    });
    var headers = {"Authorization": "Bearer $token", "Content-Type": "application/json"};
    http.post(url, body: body, headers: headers).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }

  pushChat(MyChat chat) {
    // Push Data into Firebase
    var firebaseRef =
        database.reference().child('app').child('chat/eMew2WXM7jbrldlh4MjT29TcqKO2!!quiwSufuKOdfIVc71ndZe1ispr02').push();
    firebaseRef.set(chat.toJson());
  }

  deletePost(MyPost post, String type, String postkey) {
    // Push Post to Deleted Node
    database
        .reference()
        .child('app')
        .child('deleted')
        .child(type)
        .child(globalUser.uid)
        .push()
        .set(post.toJson());
    
    // Delete post from GeoFire
    database
        .reference()
        .child('geofire')
        .child(type)
        .child(post.category)
        .child('${globalUser.uid}!!$postkey')
        .remove();

    // Delete Post from Actual Node
    database
        .reference()
        .child('app')
        .child(type)
        .child(globalUser.uid)
        .child(postkey)
        .remove();
  }
}
