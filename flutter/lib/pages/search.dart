import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/fab.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Search'),
      ),
        body: new Center(
            child: new Text('Hello in Search Page!'),
            ),
        drawer: new AppDrawer(),
        floatingActionButton: new AppFab(),
      );
  }
}