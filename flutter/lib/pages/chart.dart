import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';

class ChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat'),
      ),
        body: new Center(
            child: new Text('Hello in Chat Page!'),
            ),
        drawer: new AppDrawer(),
      );
  }
}