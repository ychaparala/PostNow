import 'package:firebase_database/firebase_database.dart';

class MyChat {
  String key;
  String message;
  String time;
  String uid;

  MyChat({
    this.key,
    this.message,
    this.time,
    this.uid
  });

  MyChat.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        message = snapshot.value["message"],
        time = snapshot.value["time"],
        uid = snapshot.value["uid"];


  MyChat.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        message = json['message'],
        time = json['time'],
        uid = json['uid'];

  Map toJson(){ return {
        'message': message,
        'time': time,
        'uid': uid
      };
  }
}
