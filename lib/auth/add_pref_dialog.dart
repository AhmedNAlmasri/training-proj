import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionFloat extends StatefulWidget {
  @override
  State<FunctionFloat> createState() => _FunctionFloatState();
  final TextEditingController textContent;

  FunctionFloat(this.textContent, );
}

class _FunctionFloatState extends State<FunctionFloat> {
  var yourInput = 'fff';
  Future<void> saveName(name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', widget.textContent.text);
  }

  Future<void> showName() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name').toString();
    yourInput = name;
  }

  @override
  void initState() {
    showName();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (ctx) => Dialog(
            child: Center(
              child: Column(
                children: [
                  Text(yourInput),
                  Container(
                    height: 300,
                    width: 300,
                    child: TextField(
                      controller: widget.textContent,
                      decoration: InputDecoration(hintText: yourInput),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await saveName(widget.textContent.text);
                      setState(() {
                        showName();
                      });
                      Navigator.of(context).pop(widget.textContent
                          .text); //popping and returning the content
                    },
                    child: const Text('save'),
                  ),
                ],
              ),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.textContent.text),
          ),
        );
      },
      child: const Icon(Icons.add_box_rounded),
    );
  }
}
