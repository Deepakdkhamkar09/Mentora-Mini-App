import 'package:get/get.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/session_model.dart';

class SessionsController extends GetxController {
  final sessions = <SessionModel>[].obs;
  final isLoading = false.obs;

  Future<void> fetchSessions(int lessonId) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    sessions.assignAll(MockData.sessions[lessonId] ?? []);
    isLoading.value = false;
  }
}
