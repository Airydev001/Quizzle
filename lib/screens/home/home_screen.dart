import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizle/configs/themes/app_colors.dart';
import 'package:quizle/configs/themes/app_icons.dart';
import 'package:quizle/configs/themes/custom_text_styles.dart';
import 'package:quizle/configs/themes/ui_parameters.dart';
import 'package:quizle/controllers/question_papers/question_paper_controller.dart';
import 'package:quizle/screens/home/question_card.dart';
import 'package:quizle/services/firebase_storage_services.dart';
import 'package:quizle/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(QuestionPaperController());
    Get.put(FirebaseStorageService());
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
        body: Obx(() => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                      placeholder:
                          AssetImage("assets/images/app_splash_logo.png"),
                      image: NetworkImage(
                          _questionPaperController.allpaperImages[index])),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: _questionPaperController.allpaperImages.length)));
  }
}
