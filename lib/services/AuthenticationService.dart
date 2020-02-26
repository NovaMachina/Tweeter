import 'package:tweeter/net/ServerFacade.dart';
import 'package:tweeter/utils/ToastHelper.dart';

class AuthenticationService {
  static AuthenticationService _INSTANCE;

  static AuthenticationService getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = AuthenticationService();
    }
    return _INSTANCE;
  }

  String login(String username, String password) {
    String result = ServerFacade.getInstance().login(username, password);
    return result;
  }
}
