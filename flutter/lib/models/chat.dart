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
