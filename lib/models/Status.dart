class Status {
  String _author;
  String _timestamp;
  String _content;

  Status(this._author, this._timestamp, this._content);

  String get getAuthor => _author;

  String get getTimestamp => _timestamp;

  String get getContent => _content;
}
