import 'dart:ui';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newProj/auth/sign_in.dart';
import 'package:newProj/test_page.dart';
import './auth/login_screen.dart';
import './auth/edit_profile.dart';
import './http requests/super_plan.dart';

class PersonalProfile extends StatelessWidget {
  static const routeName = '/personalProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CupertinoNavigationBar(),
      body: Stack(clipBehavior: Clip.none, children: [
        ClipPath(
          clipper: CurvedBottomClipper(),
          child: Container(
            color: Color.fromRGBO(82, 149, 82, 1.0),
            height: 190.0,
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 80),
            )),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditProfile.routeName);
                  },
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'),
                ),
              ),
            ),
            Text(
              'MR.Random',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            Text(
              'mrrandom@gmail.com',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(SignInScreen.routeName),
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.save),
                    title: Text('Sign In'),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuperPlan.routeName);
                  },
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.carCrash,
                      color: Colors.deepOrange,
                    ),
                    title: Text('Super Plan'),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(SignUp.routeName),
                  child: ListTile(
                    leading: Icon(Icons.ten_k),
                    title: Text('Sign Up'),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/help_screen');
                  },
                  child: ListTile(
                    leading: FaIcon(Icons.live_help),
                    title: Text('Help'),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Test.routeName);
        },
        hoverColor: Colors.pink,
        child: Icon(
          Icons.android,
          color: Color.fromRGBO(224, 124, 100, 1),
        ),
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 5;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}
