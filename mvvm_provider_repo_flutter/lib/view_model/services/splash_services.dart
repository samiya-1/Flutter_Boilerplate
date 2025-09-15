import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/model/user_model.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/view_model/user_view_model.dart';

class SplashServices {
 
  Future<UserModel> getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{




  getUserData().then((value)async
  {
    if(value.token=="null" || value.token ==''){
    await  Future.delayed(Duration(seconds: 3));

Navigator.pushNamed(context, RoutesName.login);
    }else{
     await Future.delayed(Duration(seconds: 3));
Navigator.pushNamed(context, RoutesName.home);

    }

  }).onError((error,StackTrace){
    if(kDebugMode){
      print(error.toString());
    }
  });
}
}