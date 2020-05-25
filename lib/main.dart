import 'package:flutter/material.dart';

import './src/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login System #1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    return LoginPage(
      emailValidator: (String email) {
        if (email.isEmpty) {
          return 'Email is required.';
        } else {
          return null;
        }
      },
      passwordValidator: (String password) {
        if (password.isEmpty) {
          return 'Password is requried.';
        } else {
          return null;
        }
      },
    );
  }
}
