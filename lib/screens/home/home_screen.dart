import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizle/configs/themes/app_colors.dart';
import 'package:quizle/configs/themes/app_icons.dart';
import 'package:quizle/configs/themes/custom_text_styles.dart';
import 'package:quizle/configs/themes/ui_parameters.dart';
import 'package:quizle/controllers/question_papers/question_paper_controller.dart';
import 'package:quizle/controllers/zoom_drawer.dart';
import 'package:quizle/screens/home/menu_screen.dart';
import 'package:quizle/screens/home/question_card.dart';
import 'package:quizle/services/firebase_storage_services.dart';
import 'package:quizle/widgets/app_circle_button.dart';
import 'package:quizle/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    Get.put(FirebaseStorageService());
    Get.put(QuestionPaperController());

    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            menuBackgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.8,
            menuScreen: MyMenuScreen(),
            mainScreen: Container(
                decoration: BoxDecoration(gradient: mainGradient()),
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              child: const Icon(
                                AppIcons.menuLeft,
                              ),
                              onTap: controller.toggleDrawer,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  AppIcons.peace,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Hello friend",
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text(
                              "What do you want to learn today?",
                              style: headerText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(() => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                    model: _questionPaperController
                                        .allPapers[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount:
                                  _questionPaperController.allPapers.length)),
                        ),
                      ),
                    ),
                  ],
                ))),
          );
        },
      ),
    );
  }
}
