import 'package:flutter/material.dart';
import '../../src/forms/sign_in_form_02.dart';
import '../../src/forms/sign_up_form_01.dart';

class LoginSystem02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TabBar(
                          indicator: UnderlineTabIndicator(
                            insets: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 10.0,
                            ),
                          ),
                          tabs: <Widget>[
                            Tab(
                              child: Text('SIGN IN'),
                            ),
                            Tab(
                              child: Text('SIGN UP'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      SignInForm02(),
                      SignUpForm01(),
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
}
