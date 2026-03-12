import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/student_model.dart';

class ParentController extends GetxController {
  final students = <StudentModel>[].obs;
  final isLoading = false.obs;
  final currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    final dynamic args = Get.arguments;
    if (args is UserModel) {
      currentUser.value = args;
    }
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    students.assignAll(MockData.students);
    isLoading.value = false;
  }

  void addStudent(StudentModel student) {
    students.add(student);
    // Also register as a loginable user
    MockData.addStudentUser(student);
    Get.back();
    Get.snackbar("Success", "Student added successfully");
  }
}

