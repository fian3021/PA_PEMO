import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String password, context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text(
              'Penggunaan Password Terlalu Lemah',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text(
              'Email telah terdaftar di Akun',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      var errorMessage = 'Authentication failed';
      print(e.toString());

      if (e.toString().contains('user-not-found')) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text(
                'Pengguna tidak di temukan',
                style: Theme.of(ctx).textTheme.bodyMedium,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          );
        // errorMessage = 'This email address is already in use.';

        // if (e.code == 'user-not-found') {
        //   await showDialog(
        //     context: context,
        //     builder: (ctx) => AlertDialog(
        //       content: Text(
        //         'Pengguna tidak di temukan',
        //         style: Theme.of(ctx).textTheme.bodyMedium,
        //       ),
        //       actions: <Widget>[
        //         TextButton(
        //           child: Text("OK"),
        //           onPressed: () {
        //             Navigator.of(ctx).pop();
        //           },
        //         ),
        //       ],
        //     ),
        //   );

        //   print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text(
              'Password yang terdaftar salah',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
        // print('Wrong password provided for that user.');
      }
    } 
    //catch (e) {
    //   print(e);
    // }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
