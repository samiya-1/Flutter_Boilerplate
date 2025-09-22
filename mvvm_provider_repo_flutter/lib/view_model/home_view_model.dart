import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/data/response/api_response.dart';
import 'package:mvvm_provider_repo_flutter/model/movielist_model.dart';
import 'package:mvvm_provider_repo_flutter/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _myRepo
        .fetchMovieList()
        .then((value) {
          setMoviesList(ApiResponse.completed(value));
        })
        .onError((error, StackTrace) {
          setMoviesList(ApiResponse.error(error.toString()));
        });
  }
}
