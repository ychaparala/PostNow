import 'package:first_app/components/drawer.dart';
import 'package:first_app/pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:first_app/globals.dart';


final FirebaseDatabase database = new FirebaseDatabase();

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat'),
      ),
      body: new ChatScreen(),
      // `body: new StreamBuilder(
      //     stream: database.reference().child('app/chat/${globalUser.uid}').once().asStream(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) return const Text('Loading...');
      //       return new ListView.builder(
      //         itemCount: snapshot.data.documents.length,
      //         padding: const EdgeInsets.only(top: 10.0),
      //         itemExtent: 25.0,
      //         itemBuilder: (context, index) {
      //           var ds = snapshot.data.documents[index];
      //           return new Text(" $ds");
      //         }
      //       );
      //     }),`
      drawer: new AppDrawer(),
    );
  }
}