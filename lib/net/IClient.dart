import 'package:tweeter/net/requests/LoginRequest.dart';
import 'package:tweeter/net/requests/RegisterRequest.dart';

abstract class IClient {
  String login(LoginRequest request);

  String register(RegisterRequest registerRequest) {}
}
