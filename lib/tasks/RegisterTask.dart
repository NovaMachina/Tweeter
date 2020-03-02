import 'package:tweeter/net/requests/RegisterRequest.dart';
import 'package:tweeter/services/AuthenticationService.dart';
import 'package:tweeter/tasks/observers/IRegisterObserver.dart';
import 'package:tweeter/utils/ToastHelper.dart';

class RegisterTask {
  IRegisterObserver _observer;

  RegisterTask(this._observer);

  Future<void> registerUser(
      String firstName, String lastName, String alias, String password) {
    return Future.delayed(Duration(seconds: 3), () {
      String result = AuthenticationService.getInstance()
          .register(firstName, lastName, alias, password);
      ToastHelper.showToast(result);
      if (result == null) {
        _observer.onRegisterSuccess();
      } else {
        _observer.onRegisterError(result);
      }
    });
  }
}
