import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/user_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;
    final user = await MockData.login(email, password);
    isLoading.value = false;

    if (user != null) {
      _redirectUser(user);
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red[700],
      );
    }
  }

  void _redirectUser(UserModel user) {
    switch (user.role) {
      case 'parent':
        Get.offAllNamed('/parent-dashboard', arguments: user);
        break;
      case 'student':
        Get.offAllNamed('/student-dashboard', arguments: user);
        break;
      case 'mentor':
        Get.offAllNamed('/mentor-dashboard', arguments: user);
        break;
      default:
        Get.snackbar("Error", "Unknown role");
    }
  }
}
