import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import './db_helper.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit_profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var focus = FocusNode();
  var lengthOfList = 0;
  var userNames = [];
  var usersPasses = [];
  List<TextEditingController> controllers = [];

  void getNameAndPass() async {
    final dbList = await DatabaseHelper.getDatabaseContent('accounts');

    userNames = dbList.map((e) => e['username']).toList();
    usersPasses = dbList.map((e) => e['password']).toList();
    setState(() {
      lengthOfList = dbList.length;
    });
  }

  String _errorText(int i) {
    // at any time, we can get the text from _controller.value.text
    final text = usersPasses[i];
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    if (!RegExp("(?=.*[A-Z])").hasMatch(text)) {
      return 'Must contain uppercase letters';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void initState() {
    getNameAndPass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Edit Profile'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          controllers.add(new TextEditingController());
          return Center(
            child: ListTile(
              leading: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'username',
                    style: TextStyle(fontSize: 12, color: Colors.green[600]),
                  ),
                  Text(
                    userNames[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'password',
                    style: TextStyle(
                        decorationStyle: TextDecorationStyle.dashed,
                        color: Theme.of(context).primaryColor),
                  ),
                  TextField(
                    // focusNode: focus,
                    // onChanged: (_) {
                    //   setState(() {});
                    // },
                    onSubmitted: (_) {
                      print('test test');
                      setState(() {
                        focus.unfocus();
                      });
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.streetAddress,
                    onEditingComplete: () {
                      setState(() {
                        DatabaseHelper.changePass(
                          userNames[index],
                          controllers[index].text,
                        );
                      });
                    },
                    controller: controllers[index],
                    // onChanged: (text) => setState(() => 'blah blah'),
                    decoration: InputDecoration(
                        errorText: _errorText(index),
                        hintText: '${usersPasses[index]}',
                        hintStyle: TextStyle(fontSize: 20)),
                    // Text('password: ' + usersPasses[index]),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () async {
                  await DatabaseHelper.deleteObject(userNames[index]);
                  getNameAndPass();
                  setState(() {});
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          );
        },
        itemCount: lengthOfList,
      ),
    );
  }
}
