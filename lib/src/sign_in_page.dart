import 'package:flutter/material.dart';

import '../src/sign_in_form.dart';
import '../src/sign_up_form.dart';
import '../src/type_defs.dart';

class LoginPage extends StatefulWidget {
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final OnSubmitPressed onSubmitPressed;
  final Function onLinkPressed;
  final String signInText,
      submitText,
      linkText,
      signInHeaderLabel,
      signUpHeaderLabel;

  LoginPage({
    this.onSignInButtonPressed,
    this.onSubmitPressed,
    this.onLinkPressed,
    this.emailValidator,
    this.passwordValidator,
    this.signInText = 'Sign In',
    this.submitText = 'Submit',
    this.linkText = 'Forgot Password?',
    this.signInHeaderLabel = 'Welcome Back!',
    this.signUpHeaderLabel = 'Sign Up!',
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _tabBarHeight = 60;
  double _formHeight;

  @override
  Widget build(BuildContext context) {
    // 60px for any additional padding.
    _formHeight = MediaQuery.of(context).size.height - (_tabBarHeight + 60);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  height: _tabBarHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.white,
                      ),
                      insets: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                    ),
                    tabs: <Widget>[
                      _customizedTab('Login'),
                      _customizedTab('Create Account'),
                    ],
                  ),
                ),
                Container(
                  height: _formHeight,
                  child: TabBarView(
                    children: <Widget>[
                      SignInForm(),
                      SignUpForm(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customizedTab(String label) {
    return Text(
      label,
      style: TextStyle(fontFamily: 'RobotoSlab'),
    );
  }
}
