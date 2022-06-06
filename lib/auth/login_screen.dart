import 'package:flutter/material.dart';
import './db_helper.dart';
import './add_pref_dialog.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var prefController = TextEditingController();
  var textFromDialog = '1234';

  gettingDialogContent() async {}

  void dialogError(String message) {
    print('open dialog');
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: const Text('Something went wrong'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK'),
            )
          ]),
    );
  }

  Future<bool> submitInfo() async {
    print('oof');
    final dbList = await DatabaseHelper.getDatabaseContent('accounts');
    var content = dbList.map((e) => e['username']).toList();

    // content.contains(nameController.text)
    // dbList.where(
    //   (element) => element.containsValue(nameController.text) ||
    //           nameController.text.trim() != "" ||
    //           passController.text != "");

    if (content.contains(nameController.text)) {
      dialogError('name already exist'); // User
      return false; // Exist
    } else if (nameController.text.isEmpty) {
      dialogError('please enter a name');
      return false; // UserExist
    } else {
      DatabaseHelper.insertToDatabase(
        'accounts',
        {
          'id': content.length,
          'username': nameController.text,
          'password': passController.text
        },
      );
      Navigator.of(context).pop();
      return true;
    }

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Theme.of(context).errorColor,
    //     content: Text('something went wrong'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Container(
        height: 470,
        child: Card(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.mail),
                      hintText: 'username',
                    ),
                    controller: nameController,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: TextFormField(
                    onChanged: (_) => setState(() {}),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'password can\'t be empty';
                      } else if (value.length <= 5) {
                        return 'password must be at least 5 letters';
                      } else if (!RegExp("(?=.*[A-Z])").hasMatch(value)) {
                        return 'needs to contain Uppercase';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.security),
                      hintText: 'password',
                      // errorText: _errorMessage(passController.value.text)
                    ),
                    controller: passController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: ElevatedButton(
                        child: Text('submit'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            bool value = await submitInfo();
                            if (value == true) {
                              setState(() {
                                nameController.clear();
                                passController.clear();
                              });
                            }
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FunctionFloat(prefController),
    );
  }
}
