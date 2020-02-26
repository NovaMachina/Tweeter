import 'package:tweeter/net/IClient.dart';

class MockBackendClient implements IClient {
  //TODO: Change to use LoginRequest
  @override
  String login(String username, String password) {
    if (username == "username" && password == "password") {
      return null;
    }
    return "Could not find credentials.";
  }
}
