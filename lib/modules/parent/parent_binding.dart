import 'package:get/get.dart';
import 'parent_controller.dart';
import 'create_student_controller.dart';

class ParentBinding extends Bindings {
  @override
  void dependencies() {
    // Use fenix:true so the same instance is reused across routes.
    Get.lazyPut<ParentController>(() => ParentController(), fenix: true);
    Get.lazyPut<CreateStudentController>(() => CreateStudentController(), fenix: true);
  }
}
