import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_provider_repo_flutter/data/app_exception.dart';
import 'package:mvvm_provider_repo_flutter/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  static const String apiKey = 'reqres-free-v1';
  Map<String, String> get _headers => {
    'x-api-key': apiKey,
    'Content-Type': 'application/json',
  };

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url), headers: _headers)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Intenet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(url),
        headers: _headers,
        body: jsonEncode(data),
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Intenet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());

      default:
        throw FetchDataException(
          'Error occured while communicating with serverwith status code${response.statusCode}',
        );
    }
  }
}
