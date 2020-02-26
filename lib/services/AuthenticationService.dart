import 'package:tweeter/net/ServerFacade.dart';

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
}
