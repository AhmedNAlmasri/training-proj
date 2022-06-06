import 'dart:ui';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import './profile.dart';
import './restaurant_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navIndex = 0;
  // pushNotAccess() async {
  //   final fcmToken = await FirebaseMessaging.instance.getToken();
  //   await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // }

  _bottomNavSelector(int i) {
    setState(() {
      navIndex = i;
      if (i == 2) {
        Navigator.of(context).pushNamed(PersonalProfile.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                context.locale = Locale('en');
              },
              child: const Text(
                'EN',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            TextButton(
              onPressed: () {
                context.locale = Locale('ar');
              },
              child: const Text(
                'العربيه',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            IconButton(icon: Icon(Icons.translate), onPressed: null),
          ],
          leading: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: null,
          ),
          // title: Text('Food Recipe'),
          title: Image.network(
              'https://img.freepik.com/free-vector/bow-tie-tuxedo-utensil-restaurant-logo_57043-22.jpg'),
          titleSpacing: 10,
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: RestaurantPage(),) ,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: navIndex,
            onTap: _bottomNavSelector,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.lightGreen,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: 'account',
              ),
            ]));
  }
}
