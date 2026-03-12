import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'parent_controller.dart';
import '../../data/models/student_model.dart';

class CreateStudentController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();

  final selectedDate = Rx<DateTime?>(null);
  final isPasswordVisible = false.obs;

  final parentController = Get.find<ParentController>();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    dobController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void submitForm() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        selectedDate.value != null &&
        passwordController.text.isNotEmpty) {
      if (passwordController.text.length < 6) {
        Get.snackbar(
          "Weak Password",
          "Password must be at least 6 characters.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }
      parentController.addStudent(
        StudentModel(
          name: nameController.text,
          email: emailController.text,
          dob: selectedDate.value!,
          password: passwordController.text,
        ),
      );
      // Reset form for next use
      nameController.clear();
      emailController.clear();
      dobController.clear();
      passwordController.clear();
      selectedDate.value = null;
    } else {
      Get.snackbar(
        "Incomplete Form",
        "Please fill in all details before proceeding.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
