import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/models/post.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseDatabase database = new FirebaseDatabase();

class Firebase {
  FirebaseUser user;
  Firebase() {
    _getUser();
  }

  _getUser() async {
    await _auth.currentUser().then((firebaseUser) {
      user = firebaseUser;
    });
  }

  pushData(String type, MyPost post) {
    database
        .reference()
        .child('app')
        .child(type)
        .child(user.uid)
        .push()
        .set(post.toJson());
  }

  deletePost(MyPost post, String type, String postkey) {
    // Push Post to Deleted Node
    database
        .reference()
        .child('app')
        .child('deleted')
        .child(type)
        .child(user.uid)
        .push()
        .set(post.toJson());

    // Delete Post from Actual Node
    database
        .reference()
        .child('app')
        .child(type)
        .child(user.uid)
        .child(postkey)
        .remove();
  }
}
