import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
  static const routeName = '/test';
}

class _TestState extends State<Test> {
  SharedPreferences prefs;
  TextEditingController controller = new TextEditingController();
  String name = "";
  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("username", controller.text.toString());
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("username");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: name,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  save();
                },
              ),
              ElevatedButton(
                child: Text("get data"),
                onPressed: () {
                  retrieve();
                },
              ),
            ],
          )),
    );
  }
}
