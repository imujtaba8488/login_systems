import 'package:flutter/material.dart';

import '../widgets/text_form_field_02.dart';

class SignInForm02 extends StatefulWidget {
  @override
  _SignInForm02State createState() => _SignInForm02State();
}

class _SignInForm02State extends State<SignInForm02> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                'Access Account',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'Sign in with Email and Password',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Form(
          child: Column(
            children: <Widget>[
              TextFormField02(hintText: 'Email'),
              TextFormField02(hintText: 'Password'),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 30),
                child: OutlineButton(
                  onPressed: () {},
                  child: Text('Sign In'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
