import 'package:flutter/material.dart';

import './src/pages/login_system_02.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login System #1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFFC0C0C0),
      ),
      home: MyHomePage(title: 'Login Systems'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginSystem02(
      emailValidator: (String value) {
        if (value.isEmpty) {
          return 'Email cannot be empty.';
        } else {
          return null;
        }
      },
      onSignUpButtonPressed: (firstName, lastName, email, password){
        print('$firstName $lastName $email $password');
      },
    );
  }
}
