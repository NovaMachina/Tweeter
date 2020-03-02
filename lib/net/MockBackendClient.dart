import 'package:tweeter/net/IClient.dart';
import 'package:tweeter/net/requests/LoginRequest.dart';
import 'package:tweeter/net/requests/RegisterRequest.dart';

class MockBackendClient implements IClient {
  @override
  String login(LoginRequest request) {
    if (request.getUsername == "username" &&
        request.getPassword == "password") {
      return null;
    }
    return "Could not find credentials.";
  }

  @override
  String register(RegisterRequest registerRequest) {
    return null;
  }
}
