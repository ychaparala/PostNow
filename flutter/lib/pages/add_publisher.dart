import 'package:flutter/material.dart';
// import 'package:first_app/components/drawer.dart';

class AddPublisherPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Post'),
      ),
        body: new Center(
            child: new Text('Hello in Add Publisher Page!'),
            ),
        // drawer: new AppDrawer(),
      );
  }
}