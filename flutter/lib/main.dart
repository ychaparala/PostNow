import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/routes.dart';
import 'dart:async';
// import 'package:map_view/map_view.dart';
// import 'package:mapbox_gl/controller.dart';
// import 'package:mapbox_gl/flutter_mapbox.dart';
// import 'package:mapbox_gl/overlay.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> _signInAnonymously() async {
  FirebaseUser user;
  if (_auth.currentUser() != null) {
    await _auth.currentUser().then((firebaseUser) async {
      await firebaseUser.reload();
      user = await _auth.signInAnonymously();
    }).catchError((e) async {
      user = await _auth.signInAnonymously();
    });
  } else {
    print("In Else");
    user = await _auth.signInAnonymously();
  }
  return user;
}

void main() async {
  FirebaseUser user;
  user = await _signInAnonymously();
  print(user);
  new Routes();
}