import 'package:tweeter/net/IClient.dart';
import 'package:tweeter/net/requests/LoginRequest.dart';
import 'package:tweeter/net/requests/RegisterRequest.dart';

class ServerFacade {
  static ServerFacade _instance;
  static IClient _client;

  static void setClient(IClient client) {
    _client = client;
  }

  static ServerFacade getInstance() {
    if (_instance == null) {
      _instance = ServerFacade();
    }
    return _instance;
  }

  String login(String username, String password) {
    return _client.login(LoginRequest(username, password));
  }

  String register(
      String firstName, String lastName, String alias, String password) {
    return _client
        .register(RegisterRequest(firstName, lastName, alias, password));
  }
}
