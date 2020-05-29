import 'package:flutter/material.dart';

import '../widgets/text_form_field_02.dart';

class SignUpForm02 extends StatefulWidget {
  @override
  _SignUpForm02State createState() => _SignUpForm02State();
}

class _SignUpForm02State extends State<SignUpForm02> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email, _password, _firstName, _lastName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(),
        _form(),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Create Account',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'Sign up with Email and Password',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Column(
          children: <Widget>[
            TextFormField02(
              hintText: 'Email',
              onSaved: (String value) => _email = value,
              // validator: widget.emailValidator,
            ),
            SizedBox(height: 5.0),
            TextFormField02(
              hintText: 'Password',
              onSaved: (String value) => _password = value,
              // validator: widget.passwordValidator,
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextFormField02(
                  width: MediaQuery.of(context).size.width / 2.3,
                  hintText: 'First Name',
                ),
                TextFormField02(
                  width: MediaQuery.of(context).size.width / 2.3,
                  hintText: 'Last Name',
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: OutlineButton(
                // onPressed: _onFormSave,
                onPressed: () {},
                child: Text('SIGN UP'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
