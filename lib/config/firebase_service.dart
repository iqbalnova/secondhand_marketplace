// firebase_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  // Initialize Firebase
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Register a new user
  Future<void> registerWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      } else if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error during registration: $e');
      }
    }
  }

  // Sign in with email and password
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error during sign-in: $e');
      }
    }
  }

  // Sign out
  Future<void> signOut() async {
    print(FirebaseAuth.instance.signOut());
    await FirebaseAuth.instance.signOut();
  }

  // Get the current user
  User? getCurrentUser() {
    print(FirebaseAuth.instance.currentUser);
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> deleteAccount() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.delete();
        if (kDebugMode) {
          print('Account deleted successfully');
        }
      } else {
        if (kDebugMode) {
          print('No user is currently signed in');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting account: $e');
      }
    }
  }
}
