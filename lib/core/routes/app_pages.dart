import 'package:get/get.dart';
import '../../modules/auth/auth_binding.dart';
import '../../modules/auth/login_view.dart';
import '../../modules/parent/parent_dashboard_view.dart';
import '../../modules/parent/create_student_view.dart';
import '../../modules/parent/parent_binding.dart';
import '../../modules/student/student_dashboard_view.dart';
import '../../modules/mentor/mentor_dashboard_view.dart';
import '../../modules/lessons/lessons_view.dart';
import '../../modules/lessons/lesson_detail_view.dart';
import '../../modules/sessions/sessions_view.dart';
import '../../modules/sessions/session_detail_view.dart';

class AppPages {
  static const initial = '/login';

  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/parent-dashboard',
      page: () => const ParentDashboardView(),
      binding: ParentBinding(),
    ),
    GetPage(
      name: '/student-dashboard',
      page: () => const StudentDashboardView(),
    ),
    GetPage(
      name: '/mentor-dashboard',
      page: () => const MentorDashboardView(),
    ),
    GetPage(
      name: '/create-student',
      page: () => const CreateStudentView(),
      binding: ParentBinding(),
    ),

    GetPage(
      name: '/lessons',
      page: () => const LessonsView(),
    ),
    GetPage(
      name: '/lesson-detail',
      page: () => const LessonDetailView(),
    ),
    GetPage(
      name: '/sessions',
      page: () => const SessionsView(),
    ),
    GetPage(
      name: '/session-detail',
      page: () => const SessionDetailView(),
    ),
  ];
}
