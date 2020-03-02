class RegisterRequest {
  String _firstName;
  String _lastName;
  String _alias;
  String _password;

  RegisterRequest(this._firstName, this._lastName, this._alias, this._password);

  String get getFirstName => _firstName;

  String get getLastName => _lastName;

  String get getAlias => _alias;

  String get getPassword => _password;
}
