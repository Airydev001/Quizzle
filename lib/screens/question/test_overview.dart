import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizle/configs/themes/custom_text_styles.dart';
import 'package:quizle/configs/themes/ui_parameters.dart';
import 'package:quizle/controllers/question_papers/question_controller.dart';
import 'package:quizle/screens/home/question_card.dart';
import 'package:quizle/widgets/common/background_decoration.dart';
import 'package:quizle/widgets/common/custom_app_bar.dart';
import 'package:quizle/widgets/common/main_button.dart';
import 'package:quizle/widgets/content_area.dart';
import 'package:quizle/widgets/questions/answer_card.dart';
import 'package:quizle/widgets/questions/countdown_timer.dart';
import 'package:quizle/widgets/questions/question_number_card.dart';

class TestOverviewWidget extends GetView<QuestionsController> {
  const TestOverviewWidget({super.key});
  static const String routeName = '/testoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: controller.completedTest),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                    time: '',
                    color: UIParameters.isDarkMode()
                        ? Theme.of(context).textTheme.bodyLarge!.color
                        : Theme.of(context).primaryColor,
                  ),
                  Obx(() => Text(
                        '${controller.time} Remaining',
                        style: countDownTimerTs(),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (_, index) {
                      AnswerStatus? _answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        _answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                        index: index + 1,
                        status: _answerStatus,
                        onTap: () => controller.jumpToQuestion(index),
                      );
                    }),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: MainButton(
                    onTap: () {
                      controller.complete();
                    },
                    title: 'Complete',
                  ),
                ),
              )
            ],
          )))
        ],
      )),
    );
  }
}
