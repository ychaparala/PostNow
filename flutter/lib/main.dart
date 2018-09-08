import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/routes.dart';
import 'dart:async';

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
    user = await _auth.signInAnonymously();
  }
  return user;
}

void main() async {
  await _signInAnonymously();
  new Routes();
}