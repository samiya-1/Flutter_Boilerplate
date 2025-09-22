import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/model/user_model.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value) async {
          print(value.token.toString());
          if (value.token.toString() == 'null' ||
              value.token.toString() == '') {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.login,
              (route) => false,
            );
          } else {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.home,
              (route) => false,
            );
          }
        })
        .onError((error, StackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
