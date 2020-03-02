import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/pages/HomePage.dart';
import 'package:tweeter/pages/RegisterPage.dart';
import 'package:tweeter/tasks/LoginTask.dart';
import 'package:tweeter/tasks/observers/ILoginObserver.dart';
import 'package:tweeter/utils/ToastHelper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tweeter",
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: const Text("Tweeter"),
        ),
        body: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> implements ILoginObserver {
  final _loginFormKey = GlobalKey<FormState>();
  String _username;
  String _password;

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Username",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                _username = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                _password = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: _showProgress
                ? CircularProgressIndicator(
                    value: null,
                  )
                : RaisedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState.validate()) {
                        LoginTask task = LoginTask(this);
                        task.loginUser(_username, _password);
                        _toggleSubmitState();
                      }
                    },
                    child: Text("Submit"),
                  ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return RegisterPage();
              }));
            },
            child: Text("Don't have an account? Click here to register."),
          ),
        ],
      ),
    );
  }

  void _toggleSubmitState() {
    setState(() {
      _showProgress = !_showProgress;
    });
  }

  @override
  void onLoginError(String message) {
    _toggleSubmitState();
    ToastHelper.showToast(message);
  }

  @override
  void onLoginSuccess() {
    _toggleSubmitState();
    Navigator.pushReplacement(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return HomePage();
      },
    ));
  }
}
