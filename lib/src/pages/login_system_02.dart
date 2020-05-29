import 'package:flutter/material.dart';

import '../forms/sign_in_form_02.dart';
import '../forms/sign_up_form_02.dart';
import '../global.dart';

class LoginSystem02 extends StatelessWidget {
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final Function onLinkButtonPressed;

  LoginSystem02({
    this.emailValidator,
    this.passwordValidator,
    this.onSignInButtonPressed,
    this.onLinkButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(child: _header()),
                    ),
                    _tabBar(),
                  ],
                ),
              ),
              Expanded(
                child: _tabBarView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Text(
        'Welcome Back!',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 35,
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TabBar(
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 5.0,
          ),
        ),
        tabs: <Widget>[
          Tab(child: Text('SIGN IN')),
          Tab(child: Text('SIGN UP')),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      children: <Widget>[
        SignInForm02(
          emailValidator: emailValidator,
          passwordValidator: passwordValidator,
          onSignInButtonPressed: onSignInButtonPressed,
          onLinkButtonPressed: onSignInButtonPressed,
        ),
        SignUpForm02(),
      ],
    );
  }
}
