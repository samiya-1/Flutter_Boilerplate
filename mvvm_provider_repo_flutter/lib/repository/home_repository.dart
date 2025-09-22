import 'package:mvvm_provider_repo_flutter/data/network/base_api_services.dart';
import 'package:mvvm_provider_repo_flutter/data/network/network_api_services.dart';
import 'package:mvvm_provider_repo_flutter/model/movielist_model.dart';
import 'package:mvvm_provider_repo_flutter/res/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMovieList() async {
    try {
      final response = await _apiServices.getGetApiResponse(
        AppUrls.moviesListUrl,
      );

      print("Movies API Response: $response");

      if (response == null) {
        throw Exception("API returned null response");
      }

      if (response is Map<String, dynamic>) {
        return MovieListModel.fromJson(response);
      } else {
        throw Exception("Invalid response format: $response");
      }
    } catch (e) {
      rethrow;
    }
  }
}
