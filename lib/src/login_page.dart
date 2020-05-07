import 'package:flutter/material.dart';

/// Defines field validation.
typedef Validator = void Function(String value);

/// Defines what happens when the loginButton is pressed.
typedef OnLoginPressed = void Function(String email, String password);

/// Defines what happens when the submitButton is pressed.
typedef OnSubmitPressed = void Function(
  String firstName,
  String lastName,
  String email,
  String password,
);

class LoginPage extends StatefulWidget {
  final Validator emailValidator, passwordValidator;
  final OnLoginPressed onLoginPressed;
  final OnSubmitPressed onSubmitPressed;
  final Function onLinkPressed;
  final String loginText,
      submitText,
      linkText,
      loginHeaderLabel,
      signUpHeaderLabel;

  LoginPage({
    this.onLoginPressed,
    this.onSubmitPressed,
    this.onLinkPressed,
    this.emailValidator,
    this.passwordValidator,
    this.loginText = 'Login',
    this.submitText = 'Submit',
    this.linkText = 'Forgot Password?',
    this.loginHeaderLabel = 'Welcome Back!',
    this.signUpHeaderLabel = 'Sign Up!',
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  height: 60,
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
                      _tabLabel('Login'),
                      _tabLabel('Create Account'),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: TabBarView(
                    children: <Widget>[
                      _loginForm(),
                      _signUpForm(),
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

  // Returns the login form.
  Widget _loginForm() {
    return Form(
      key: _loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headerLabel(widget.loginHeaderLabel),
            _customTextFormField(
              'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
            ),
            _customTextFormField(
              'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _email = value,
            ),
            _customButton(
              text: widget.loginText,
              onPressed: _onLoginFormSaved,
            ),
            _customLinkButton(
              text: widget.linkText,
              onPressed: widget.onLinkPressed,
            ),
          ],
        ),
      ),
    );
  }

  // Returns the signup form.
  Widget _signUpForm() {
    return Form(
      key: _signupFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headerLabel(widget.signUpHeaderLabel, topPadding: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _customTextFormField(
                    'First Name',
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _firstName = value,
                  ),
                  _customTextFormField(
                    'Last Name',
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _lastName = value,
                  )
                ],
              ),
            ),
            _customTextFormField(
              'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
            ),
            _customTextFormField(
              'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _password = value,
            ),
            _customButton(
              text: widget.submitText,
              onPressed: _onSignupFormSaved,
            ),
          ],
        ),
      ),
    );
  }

  // Returns a customized label to be displayed within a tab.
  Widget _tabLabel(String text) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'RobotoSlab'),
    );
  }

  // Returns the label to be displayed along the top of the page.
  Widget _headerLabel(String text, {double topPadding = 40.0}) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Pacifico',
          color: Colors.grey[800],
        ),
      ),
    );
  }

  // Returns a customized version of TextFormField.
  Widget _customTextFormField(
    String label, {
    double width,
    Icon suffixIcon,
    EdgeInsets padding,
    Function validator,
    Function onSaved,
  }) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'RobotoSlab',
            color: Colors.grey[800],
          ),
          suffixIcon: Icon(
            suffixIcon?.icon,
            color: Colors.grey[800],
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  // Returns a customized button.
  Widget _customButton({@required String text, Function onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoSlab',
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a customized link button.
  Widget _customLinkButton({@required String text, @required onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.grey[800],
            fontFamily: 'RobotoSlab',
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  /// Defines what happens when the login button on LoginForm is pressed.
  void _onLoginFormSaved() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      widget.onLoginPressed != null
          ? widget.onLoginPressed(_email, _password)
          : print('Error: No Implementation Provided');
    }
  }

  /// Defines what happens when the submit button on the SignUpForm is pressed.
  void _onSignupFormSaved() {
    if (_signupFormKey.currentState.validate()) {
      _signupFormKey.currentState.save();
      widget.onSubmitPressed != null
          ? widget.onSubmitPressed(_firstName, _lastName, _email, _password)
          : print('Error: No Implementation Provided.');
    }
  }
}
