import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/generic_post.dart';

class AddSubscriberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Subscriber Post'),
      ),
      body: new GenericPost('subscriber'),
      drawer: new AppDrawer(),
    );
  }
}
