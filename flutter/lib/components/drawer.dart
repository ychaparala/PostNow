import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                // color: Colors.,
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed("/HomePage");
              },
            ),
            ListTile(
              title: Text('Posts'),
              leading: Icon(Icons.search),
              onTap: () {
                // Navigator.pushNamed(context, "/SearchPage");
                Navigator.of(context).pushNamed("/PostsPage");
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search'),
              leading: Icon(Icons.search),
              onTap: () {
                // Navigator.pushNamed(context, "/SearchPage");
                Navigator.of(context).pushNamed("/SearchPage");
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Chat'),
              leading: Icon(Icons.chat),
              onTap: () {
                Navigator.of(context).pushNamed("/ChatPage");
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pushNamed("/SettingsPage");
              },
            ),
          ],
        ),
    );
  }
}