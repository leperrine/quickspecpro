import 'dart:async';

import 'package:meta/meta.dart';

import 'package:firebase_auth/firebase_auth.dart';

@immutable
class User {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.diaplayName,
    this.fullName,
    this.companyName,
    this.companyLogoUrl,
    this.companyWebsiteUrl,
  });
  final String uid;
  final String email;
  final String photoUrl;
  final String diaplayName;
  final String fullName;
  final String companyName;
  final String companyLogoUrl;
  final String companyWebsiteUrl;
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create User from FirebaseAuth user
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      photoUrl: user.photoUrl,
      diaplayName: user.displayName,
    );
  }

  // create Stream of authentication state of User
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  // Register with email & password
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  // Sign in with email & password
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .signInWithCredential(EmailAuthProvider.getCredential(
      email: email,
      password: password,
    ));
    return _userFromFirebase(authResult.user);
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Current FirebaseUser
  Future<User> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  // Signout
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
