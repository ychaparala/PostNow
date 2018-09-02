import pyrebase
import json

config = {
  "apiKey": "AIzaSyBoIvZnnQTVT6EojTkf_M79dAC10ogOg-8",
  "authDomain": "postit-d466d.firebaseapp.com",
  "databaseURL": "https://postit-d466d.firebaseio.com",
  "storageBucket": "postit-d466d.appspot.com"
}

firebase = pyrebase.initialize_app(config)

db = firebase.database()

with open("/projects/craigslist/firebase_data_1.json") as f:
    content = f.readlines()

for line in content:
    db.child("craigslist").push(json.loads(line))