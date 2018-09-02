import 'package:flutter/material.dart';
// import 'package:map_view/map_view.dart';
import 'package:first_app/components/drawer.dart';
import 'package:first_app/components/fab.dart';
// import 'dart:async';

// class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return new MaterialApp(
// //       title: 'Post Now',
// //       theme: new ThemeData(
// //         primarySwatch: Colors.amber,
// //         accentColor: Colors.orange,
// //       ),
// //       home: new MyHomePage(title: 'Home'),
// //     );
// //   }
// // }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var mapView = new MapView();

  // showMap() {
  //   mapView.show(
  //       new MapOptions(
  //           // mapViewType: MapViewType.normal,
  //           showUserLocation: true,
  //           showMyLocationButton: true,
  //           showCompassButton: true,
  //           hideToolbar: false,
  //           title: "Recently Visited"),
  //       );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      drawer: new AppDrawer(),
      body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 250.0,
                child: new Stack(
                  children: <Widget>[
                    new Center(
                        child: new Container(
                        child: new Text(
                          "You are supposed to see a map here.\n\nAPI Key is not valid.\n\n"
                              "To view maps in the example application set the "
                              "API_KEY variable in example/lib/main.dart. "
                              "\n\nIf you have set an API Key but you still see this text "
                              "make sure you have enabled all of the correct APIs "
                              "in the Google API Console. See README for more detail.",
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(20.0),
                        )
                      ),
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(top: 10.0),
                child: new Text(
                  "Tap the map to interact",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
      floatingActionButton: new AppFab(),
    );
  }
}