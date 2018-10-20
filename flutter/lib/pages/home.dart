import 'package:first_app/components/map.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/fab.dart';
import 'package:first_app/services/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          },),
        ],
      ),
      drawer: new AppDrawer(),
      body: new AnimatedMapControllerPage(),
      floatingActionButton: new AppFab(),
    );
  }
}