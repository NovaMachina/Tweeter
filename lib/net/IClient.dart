import 'package:tweeter/net/requests/LoginRequest.dart';

abstract class IClient {
  String login(LoginRequest request);
}
