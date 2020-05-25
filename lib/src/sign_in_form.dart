import 'package:flutter/material.dart';

import '../src/customized_text_form_field.dart';
import '../src/customized_raised_button.dart';
import '../src/header_label.dart';
import '../src/customized_link_button.dart';

class SignInForm extends StatefulWidget {
  final String signInHeaderLabel, linkText, signInText;
  final Function emailValidator, passwordValidator, onLinkPressed;

  SignInForm({
    this.signInHeaderLabel,
    this.linkText,
    this.signInText,
    this.emailValidator,
    this.passwordValidator,
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
            HeaderLabel(text: widget.signInHeaderLabel),
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
            ),
            CustomizedRaisedButton(
              text: widget.signInText,
              onPressed: _onLoginFormSaved,
            ),
            CustomizedLinkButton(
              text: widget.linkText,
              onPressed: widget.onLinkPressed,
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginFormSaved() {}
}
