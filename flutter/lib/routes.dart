import 'package:flutter/material.dart';
import 'package:first_app/pages/chat.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/search.dart';
import 'package:first_app/pages/settings.dart';
import 'package:first_app/pages/add_publisher.dart';
import 'package:first_app/pages/add_subscriber.dart';
import 'package:first_app/pages/posts.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SearchPage": (BuildContext context) => new SearchPage(),
    "/HomePage": (BuildContext context) => new HomePage(),
    "/ChatPage": (BuildContext context) => new ChatPage(),
    "/SettingsPage": (BuildContext context) => new SettingsPage(),
    "/AddPublisherPage": (BuildContext context) => new AddPublisherPage(),
    "/AddSubscriberPage": (BuildContext context) => new AddSubscriberPage(),
    "/PostsPage": (BuildContext context) => new PostsPage(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Post Now",
      home: new HomePage(),
      theme: new ThemeData(
        // primarySwatch: Colors.w,
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        // textSelectionColor: Colors.green,
        // textTheme: TextTheme(
        //   body1: new TextStyle(color: Colors.red),
        // ),
      ),
      routes: routes,
    ));
  }
}