import 'package:tweeter/net/IClient.dart';
import 'package:tweeter/net/requests/LoginRequest.dart';

class MockBackendClient implements IClient {
  //TODO: Change to use LoginRequest
  @override
  String login(LoginRequest request) {
    if (request.getUsername == "username" &&
        request.getPassword == "password") {
      return null;
    }
    return "Could not find credentials.";
  }
}
