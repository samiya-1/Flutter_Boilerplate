import 'package:mvvm_provider_repo_flutter/data/network/base_api_services.dart';
import 'package:mvvm_provider_repo_flutter/data/network/network_api_services.dart';
import 'package:mvvm_provider_repo_flutter/res/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
        AppUrls.loginUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }


  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
        AppUrls.rsegisterUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }



}
