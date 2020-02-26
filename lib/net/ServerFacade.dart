import 'package:tweeter/net/IClient.dart';

class ServerFacade {
  static ServerFacade _INSTANCE;
  static IClient _client;

  static void setClient(IClient client) {
    _client = client;
  }

  static ServerFacade getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = ServerFacade();
    }
    return _INSTANCE;
  }

  String login(String username, String password) {
    return _client.login(username, password);
  }
}
