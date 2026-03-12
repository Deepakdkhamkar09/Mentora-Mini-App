class StudentModel {
  final String name;
  final String email;
  final DateTime dob;
  final String password;

  StudentModel({
    required this.name,
    required this.email,
    required this.dob,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'dob': dob.toIso8601String()};
  }
}
