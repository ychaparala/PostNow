import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/generic_post.dart';

class AddPublisherPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Publisher Post'),
      ),
        body: new GenericPost('publisher'),
        drawer: new AppDrawer(),
      );
  }
}