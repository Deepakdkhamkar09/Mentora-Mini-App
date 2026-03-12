class UserModel {
  final int id;
  final String name;
  final String role; // parent, student, mentor
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId'],
      name: json['name'],
      role: json['role'],
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

