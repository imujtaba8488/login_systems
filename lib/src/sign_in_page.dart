import 'package:flutter/material.dart';

import '../src/sign_in_form.dart';
import '../src/sign_up_form.dart';
import '../src/type_defs.dart';

class LoginPage extends StatelessWidget {
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final OnSubmitPressed onSubmitPressed;
  final Function onLinkPressed;
  final String signInButtonLabel,
      submitButtonLabel,
      linkLabel,
      signInHeaderText,
      signUpHeaderText;

  LoginPage({
    this.onSignInButtonPressed,
    this.onSubmitPressed,
    this.onLinkPressed,
    this.emailValidator,
    this.passwordValidator,
    this.signInButtonLabel = 'Sign In',
    this.submitButtonLabel = 'Submit',
    this.linkLabel = 'Forgot Password?',
    this.signInHeaderText = 'Welcome Back!',
    this.signUpHeaderText = 'Sign Up!',
  });

  @override
  Widget build(BuildContext context) {
    final double _tabBarHeight = 60;

    // 60px for any additional padding.
    double _formHeight =
        MediaQuery.of(context).size.height - (_tabBarHeight + 60);

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
                      SignInForm(
                        headerText: signInHeaderText,
                        signInButtonLabel: signInButtonLabel,
                        emailValidator: emailValidator,
                        passwordValidator: passwordValidator,
                        linkLabel: linkLabel,
                        onSignInButtonPressed: onSignInButtonPressed,
                        onLinkPressed: onLinkPressed,
                      ),
                      SignUpForm(
                        headerText: signUpHeaderText,
                        submitButtonLabel: submitButtonLabel,
                        emailValidator: emailValidator,
                        passwordValidator: passwordValidator,
                        onSubmitPressed: onSubmitPressed,
                      ),
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
