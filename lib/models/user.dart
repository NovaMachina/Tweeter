class User {
  String _firstName;
  String _lastName;
  String _alias;
  String _imageURL;

  User(this._firstName, this._lastName, this._alias, this._imageURL);

  String get getFirstName => _firstName;

  String get getLastName => _lastName;

  String get getAlias => _alias;

  String get getImageURL => _imageURL;
}
