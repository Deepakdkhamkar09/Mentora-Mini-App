import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/lesson_model.dart';

class LessonsController extends GetxController {
  final lessons = <LessonModel>[].obs;
  final isLoading = false.obs;
  final currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    final dynamic args = Get.arguments;
    if (args is UserModel) {
      currentUser.value = args;
    }
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    lessons.assignAll(MockData.lessons);
    isLoading.value = false;
  }
}
