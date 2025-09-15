import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_provider_repo_flutter/repository/auth_repository.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/utils/utils.dart';

class AuthViewmodel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

bool _signupLoading = false;
  bool get signuploading => _signupLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }


  setsignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);

          Utils.flushBarErrorMessage('login succesful', context);
          Navigator.pushNamed(context, RoutesName.home);

          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
            Utils.flushBarErrorMessage(error.toString(), context);

          if (kDebugMode) {
            print(error.toString());
          }
        });
  }








  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignupLoading(true);
    _myRepo
        .signupApi(data)
        .then((value) {
          setsignupLoading(false);

          Utils.flushBarErrorMessage('signup succesful', context);
          Navigator.pushNamed(context, RoutesName.home);

          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setsignupLoading(false);
            Utils.flushBarErrorMessage(error.toString(), context);

          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
