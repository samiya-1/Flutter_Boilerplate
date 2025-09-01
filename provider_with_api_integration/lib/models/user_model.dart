// File: user_model.dart

class User {
  final int id;
  final String name; // This will combine first_name and last_name
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      // Combine first_name and last_name from the new API response
      name: '${json['first_name']} ${json['last_name']}', 
      email: json['email'] as String,
    );
  }
}