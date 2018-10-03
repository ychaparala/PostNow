import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/post.dart';
import 'package:first_app/components/drawer.dart';

final FirebaseDatabase database = new FirebaseDatabase();

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<MyPost> posts = new List();
  ScrollController _listViewScrollController = new ScrollController();

  _getPosts() async {
    database
        .reference()
        .child('app')
        .child('publisher')
        .child(globalUser.uid)
        .onChildAdded
        .listen(_onEntryAdded);
    database
        .reference()
        .child('app')
        .child('subscriber')
        .child(globalUser.uid)
        .onChildAdded
        .listen(_onEntryAdded);
  }

  _PostsPageState() {
    _getPosts();
  }

  _onEntryAdded(Event event) {
    setState(() {
      posts.add(new MyPost.fromJson(
          new Map<String, dynamic>.from(event.snapshot.value)));
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Posts'),
      ),
      body: new ListView.builder(
        shrinkWrap: true,
        reverse: true,
        controller: _listViewScrollController,
        itemCount: posts.length,
        itemBuilder: (buildContext, index) {
          return new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  // leading: new Icon(Icons.album),
                  leading: new Image.network(
                      "https://media.wired.com/photos/59bafdf204afdc5248726f5c/master/w_1164,c_limit/BMW-TA.jpg",
                      height: 60.0),
                  title: new Text(posts[index].title),
                  subtitle: new Text(posts[index].description),
                ),
              ],
            ),
          );
        },
      ),
      drawer: new AppDrawer(),
    );
  }
}
