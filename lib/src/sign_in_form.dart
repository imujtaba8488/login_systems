import 'package:flutter/material.dart';

import '../src/customized_text_form_field.dart';
import '../src/customized_raised_button.dart';
import '../src/header.dart';
import '../src/customized_link_button.dart';
import '../src/type_defs.dart';

class SignInForm extends StatefulWidget {
  final String headerText, signInButtonLabel, linkLabel;
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final Function onLinkPressed;

  SignInForm({
    this.headerText = 'Welcome Back!',
    this.signInButtonLabel = 'Sign In',
    this.linkLabel = 'Forgot Password?',
    this.emailValidator,
    this.passwordValidator,
    this.onSignInButtonPressed,
    this.onLinkPressed,
  });

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(text: widget.headerText),
            CustomizedTextFormField(
              label: 'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
              textInputType: TextInputType.emailAddress,
            ),
            CustomizedTextFormField(
              label: 'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _password = value,
              obscureText: true,
            ),
            CustomizedRaisedButton(
              text: widget.signInButtonLabel,
              onPressed: _onSignInFormSaved,
            ),
            CustomizedLinkButton(
              text: widget.linkLabel,
              onPressed: widget.onLinkPressed,
            ),
          ],
        ),
      ),
    );
  }

  // Action to be taken when the form is saved.
  void _onSignInFormSaved() {
    if (_signInFormKey.currentState.validate()) {
      _signInFormKey.currentState.save();
      widget.onSignInButtonPressed != null
          ? widget.onSignInButtonPressed(_email, _password)
          : print('Error: No Implementation Provided');
    }
  }
}
