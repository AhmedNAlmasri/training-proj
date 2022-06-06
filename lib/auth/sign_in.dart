import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './db_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../auth/google_signin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signIn_page';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  var nameController = TextEditingController();
  var passController = TextEditingController();
  Future<void> checkUserExist() async {
    final dbList = await DatabaseHelper.getDatabaseContent('accounts');
    var allNames = dbList.map((e) => e['username']).toList();
    var allPasswords = dbList.map((e) => e['password']).toList();

    final passIndex =
        allNames.indexWhere((element) => element == nameController.text);
    if (allNames.contains(nameController.text) &&
        allPasswords[passIndex] == passController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text('welcome ' + nameController.text),
      ));
      Navigator.of(context).pop();
    } else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).errorColor,
          content: Text('wrong name or password'),
        ),
      );
  }
// @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().whenComplete(() {
//       print("completed");
//       setState(() {});
//     });
//   }

  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount user = _googleSignIn.currentUser;

    return Scaffold(
      appBar: CupertinoNavigationBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text('Enter your username'),
                  hintText: 'username',
                ),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Enter your password'),
                  hintText: 'password',
                ),
                controller: passController,
              ),
            ),
            ElevatedButton.icon(
              // onPressed: () async {
              //   await _googleSignIn.signIn();
              //   setState(() {});
              // },
              onPressed: () {
                Authentication.signInWithGoogle(context);
                setState(() {});
              },
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text('Sign in using Google'),
            ),
            ElevatedButton.icon(
              onPressed:
                  //Authentication.xxx == null
                  //  ? null
                  //  :
                  () {
                Authentication.signOut(context);
                setState(() {});
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.black,
              ),
              label: Text(
                'Sign out of Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).errorColor),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('sign in'),
        icon: Icon(Icons.two_k_plus_rounded),
        onPressed: () async {
          await checkUserExist();
          setState(() {
            nameController.clear();
            passController.clear();
          });
        },
      ),
    );
  }
}
