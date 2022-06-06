import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static User xxx;
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<User> signInWithGoogle(BuildContext context) async {
    FirebaseAuth fireAuth = FirebaseAuth.instance;

    User user;

    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );


      try {
        final UserCredential userCredential =
            await fireAuth.signInWithCredential(credential);
        final googleUsernameEmail =    //why did this fail madry????
            fireAuth.currentUser;
        user = userCredential.user;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.lightGreen,
            duration: Duration(seconds: 2, milliseconds: 500),
            content: Column(
              children: [
                Text(
                  'welcome' + ' ' + user.displayName + " " + user.email,
                  style: TextStyle(color: Colors.black),
                ),
                Image.network(user.photoURL)
              ],
            )

            // Text(googleUsernameEmail.email +
            // ' ' +
            // googleUsernameEmail.displayName)
            ,
          ),
        );
      } on FirebaseAuthException catch (e) {
        print('not in the firebase ' );
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'The account already exists with a different credential'),
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Error occurred while accessing credentials',
              ),
            ),
          );
        }
      } catch (e) {
        print('also not in firebase!!!' );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error occurred using Google Sign In. Try again please',
            ),
          ),
        );
      }
    }
    Authentication.xxx = user;
    return user;
  }

  static Future<void> signOut(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.disconnect();

      await googleSignIn.signOut();

      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2, milliseconds: 500),
          backgroundColor: Theme.of(context).errorColor,
          content: const Text('see ya later'),
        ),
      );
    } catch (e) {
      print('failed to signOut');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not logged in any account yet'),
        ),
      );
    }
    Authentication.xxx = null;
  }
}
