import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/tasks/observers/IRegisterObserver.dart';
import 'package:tweeter/utils/ToastHelper.dart';

class RegisterPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tweeter",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: SingleChildScrollView(
          child: RegisterWidget(),
        ),
      ),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    implements IRegisterObserver {
  final _registerFormKey = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _alias;
  String _password;

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          createStandardTextInput("First Name", _firstName),
          createStandardTextInput("Last Name", _lastName),
          createStandardTextInput("Alias", _alias),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text.";
                }
                if (!value.contains(RegExp(r'\d+'))) {
                  return "Password must contain a number.";
                }
                if (value.length < 8) {
                  return "Password must be at least eight characters.";
                }
                _password = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text.";
                }
                if (value != _password) {
                  return "Passwords do not match.";
                }
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
                      if (_registerFormKey.currentState.validate()) {
//                  RegisterTask task = RegisterTask(this);
//                  task.loginUser(_username, _password);
                        _toggleSubmitState();
                      }
                    },
                    child: Text("Submit"),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void onRegisterError(String message) {
    _toggleSubmitState();
    ToastHelper.showToast(message);
  }

  @override
  void onRegisterSuccess() {
    _toggleSubmitState();
  }

  Widget createStandardTextInput(String hintText, String variable) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter some text.";
          }
          variable = value;
          return null;
        },
      ),
    );
  }

  void _toggleSubmitState() {
    setState(() {
      _showProgress = !_showProgress;
    });
  }
}
