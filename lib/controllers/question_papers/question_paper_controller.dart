import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizle/controllers/auth_Controller.dart';
import 'package:quizle/firebase_ref/references.dart';
import 'package:quizle/models/question_paper.dart';
import 'package:quizle/screens/question/question_screen.dart';
import 'package:quizle/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  final allpaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    //List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      //Get the data from the firebase collection called questionPaperRF references.dart
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);

        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
      // for (var img in imgName) {
      //   final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
      //   allpaperImages.add(imgUrl!);
      // }
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();

    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNamed()
      } else {
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    } else {
      _authController.showLoginAlertDialogue();
    }
  }
}
