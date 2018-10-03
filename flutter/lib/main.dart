import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/routes.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/globals.dart';

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
  globalUser = user;
  return user;
}

void main() async {
  await _signInAnonymously();
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  new Routes();
}