import 'package:get/get.dart';
import 'package:quizle/controllers/question_papers/question_controller.dart';
import 'package:quizle/controllers/question_papers/question_paper_controller.dart';
import 'package:quizle/controllers/zoom_drawer.dart';
import 'package:quizle/models/question_paper.dart';
import 'package:quizle/screens/home/home_screen.dart';
import 'package:quizle/screens/introduction/introduction.dart';
import 'package:quizle/screens/login/login_screen.dart';
import 'package:quizle/screens/question/answer_check_screen.dart';
import 'package:quizle/screens/question/question_screen.dart';
import 'package:quizle/screens/question/result_screen.dart';
import 'package:quizle/screens/question/test_overview.dart';
import 'package:quizle/screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
            GetPage(name: TestOverviewWidget.routeName,
            page: ()=> const TestOverviewWidget()
            ),
             GetPage(name: ResultScreen.routeName,
            page: ()=> const ResultScreen(),
            
            ),
            GetPage(name: AnswerCheckScreen.routeName,
            page: ()=> const AnswerCheckScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionsController());
            }),

            ),
      ];
}
