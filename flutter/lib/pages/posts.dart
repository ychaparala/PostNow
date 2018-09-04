import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/post.dart';
import 'package:first_app/components/drawer.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseDatabase database = new FirebaseDatabase();


class PostsPage extends StatefulWidget {
 
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<MyPost> posts = new List();
  ScrollController _listViewScrollController = new ScrollController();
  FirebaseUser user;

  _getPosts() async {
    await _auth.currentUser().then((firebaseUser) {
      user = firebaseUser;
    });
    database.reference().child('app').child('publisher').child(user.uid).onChildAdded.listen(_onEntryAdded);
    database.reference().child('app').child('subscriber').child(user.uid).onChildAdded.listen(_onEntryAdded);
  }

  _PostsPageState(){
    _getPosts();
    }

  _onEntryAdded(Event event) {
    setState(() {
      posts.add(new MyPost.fromSnapshot(event.snapshot));
      posts.map((MyPost post){
        print(post.title);
      });
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
          //calculating difference
          print(index);
          print(posts[index].title);
          new Text(posts[index].title);
          // return new InkWell(
          //     // onTap: () => _openEditEntryDialog(posts[index]),
          //     child: new WeightListItem(posts[index], difference));
        },
      ),
      drawer: new AppDrawer(),
    );
  }
}