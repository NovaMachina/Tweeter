import 'package:tweeter/services/AuthenticationService.dart';
import 'package:tweeter/tasks/observers/ILoginObserver.dart';
import 'package:tweeter/utils/ToastHelper.dart';

class LoginTask {
  ILoginObserver _observer;

  LoginTask(this._observer);

  Future<void> loginUser(String username, String password) {
    return Future.delayed(Duration(seconds: 3), () {
      String result =
          AuthenticationService.getInstance().login(username, password);
      ToastHelper.showToast(result);
      if (result == null) {
        _observer.onLoginSuccess();
      } else {
        _observer.onLoginError(result);
      }
    });
  }
}
