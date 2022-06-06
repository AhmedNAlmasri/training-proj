import 'package:flutter/material.dart';

class PageToLeave extends StatelessWidget {
  const PageToLeave({Key key}) : super(key: key);
  static const routeName = '/page_to_leave';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.brown, width: 20)),
        child: Center(
          child: TextButton(
        child: Text('go back to your home page', style: TextStyle(fontSize: 40), ),
        onPressed: () => Navigator.of(context).popUntil(
          ModalRoute.withName('/'),
        ),
      ),),),
    );
  }
}
