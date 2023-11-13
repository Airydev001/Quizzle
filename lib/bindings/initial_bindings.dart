import 'package:get/get.dart';
import 'package:quizle/controllers/auth_Controller.dart';
import 'package:quizle/controllers/theme_controllers.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
