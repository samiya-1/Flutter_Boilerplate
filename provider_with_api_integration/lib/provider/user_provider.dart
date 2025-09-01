import 'package:flutter/foundation.dart';
import 'package:provider_boilerplate_flutter/models/user_model.dart';
import 'package:provider_boilerplate_flutter/service/user_service.dart';
 // Assume this is your model class for a single user

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}