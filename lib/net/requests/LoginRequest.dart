class LoginRequest {
  String _username;
  String _password;

  LoginRequest(this._username, this._password);

  String get getUsername => _username;

  String get getPassword => _password;
}
