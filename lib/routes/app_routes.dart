import 'package:get/get.dart';
import 'package:quizle/controllers/question_papers/question_paper_controller.dart';
import 'package:quizle/screens/home/home_screen.dart';
import 'package:quizle/screens/introduction/introduction.dart';
import 'package:quizle/screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            }))
      ];
    
}