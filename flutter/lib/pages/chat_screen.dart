import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/components/chat_bubble.dart';
import 'package:first_app/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/firebase.dart';
import 'package:first_app/globals.dart';

final firebase = new Firebase();
final FirebaseDatabase database = new FirebaseDatabase();

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();
  final List<Bubble> _messages = <Bubble>[];
  bool _isComposing = false;
  _ChatScreenState() {
    database
        .reference()
        .child(
            'app/chat/eMew2WXM7jbrldlh4MjT29TcqKO2!!quiwSufuKOdfIVc71ndZe1ispr02')
        .onChildAdded
        .listen(_onEntryAdded);
  }
  _onEntryAdded(Event event) {
    MyChat chat = new MyChat.fromJson(
        new Map<String, dynamic>.from(event.snapshot.value));
    Bubble message = new Bubble(
        message: chat.message, time: '', delivered: true, isMe: chat.uid==globalUser.uid ? true : false);
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    // final localTime = new DateTime.now().toLocal().toString();
    final utcTime = new DateTime.now().toUtc().toString();
    MyChat chat = new MyChat(message: text, time: utcTime, uid: globalUser.uid);
    // Bubble message = new Bubble(
    //   message: text,
    //   time: localTime,
    //   delivered: true,
    //   isMe: true,
    //   animationController: new AnimationController(
    //     duration: new Duration(milliseconds: 400),
    //     vsync: this,
    //   ),
    // );
    firebase.pushChat(chat);
    // setState(() {
    //   _messages.insert(0, message);
    // });
    // message.animationController.forward();
  }

  @override
  void dispose() {
    for (Bubble message in _messages) message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: new IconTheme(
              data: new IconThemeData(color: Theme.of(context).accentColor),
              child: new Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.multiline,
                        // maxLines: 5,
                        controller: _textController,
                        onChanged: (String text) {
                          setState(() {
                            _isComposing = text.length > 0;
                          });
                        },
                        onSubmitted: _handleSubmitted,
                        decoration: new InputDecoration.collapsed(
                            hintText: "Send a message"),
                      ),
                    ),
                    new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 4.0),
                      child: new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
