import 'package:flutter_test/flutter_test.dart';
import 'package:tweeter/net/MockBackendClient.dart';
import 'package:tweeter/net/ServerFacade.dart';
import 'package:tweeter/services/AuthenticationService.dart';

void main() {
  setUp(() async {
    ServerFacade.setClient(MockBackendClient());
  });

  test("Login with valid credentials returns success.", () {
    String result =
        AuthenticationService.getInstance().login("username", "password");
    expect(result, equals(null));
  });

  test("Login with invalid credentials returns failure.", () {
    String result =
        AuthenticationService.getInstance().login("badUsername", "badPassword");
    expect(result, equals("Could not find credentials."));
  });

  test("Register with valid credentials returns success.", () {
    String result = AuthenticationService.getInstance()
        .register("firstName", "lastName", "alias", "password");
    expect(result, equals(null));
  });
}
