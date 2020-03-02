import 'package:tweeter/net/ServerFacade.dart';
import 'package:tweeter/net/requests/RegisterRequest.dart';

class AuthenticationService {
  static AuthenticationService _instance;

  static AuthenticationService getInstance() {
    if (_instance == null) {
      _instance = AuthenticationService();
    }
    return _instance;
  }

  String login(String username, String password) {
    String result = ServerFacade.getInstance().login(username, password);
    return result;
  }

  String register(
      String firstName, String lastName, String alias, String password) {
    String result = ServerFacade.getInstance()
        .register(firstName, lastName, alias, password);
  }
}
