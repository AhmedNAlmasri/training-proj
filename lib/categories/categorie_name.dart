import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:newProj/categories/page_to_leave.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../providers/user_info.dart';

class CategorieNameScreen extends StatefulWidget {
  static const routeName = '/categories_name';

  @override
  State<CategorieNameScreen> createState() => _CategorieNameScreenState();
}

class _CategorieNameScreenState extends State<CategorieNameScreen> {
  int randomNumber = 1;
  _getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    var permit = await Permission.camera.status;
    if (permit.isDenied) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
              'permission denied you can\'t use the camera in this application'),
        ),
      );
    } else
      setState(() async {
        await picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 1000,
          maxHeight: 1000,
        );
      });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final argTitle = ModalRoute.of(context).settings.arguments as String;
    var providerArgument = Provider.of<UserFood>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.support_agent,
            ),
            SizedBox(
              width: 5,
            ),
            Text(argTitle),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              child: Text(
                argTitle,
                style: TextStyle(fontSize: 70),
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(PageToLeave.routeName),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  providerArgument.changeValue();
                });
              },
              child: Text(
                providerArgument.recipes[providerArgument.providerNum],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: (){_getFromGallery();
        providerArgument.resetValue();},
      ),
    );
  }
}
