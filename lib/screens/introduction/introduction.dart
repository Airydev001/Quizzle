import 'package:flutter/material.dart';
import 'package:quizle/configs/themes/app_colors.dart';
import 'package:quizle/routes/app_routes.dart';
import 'package:quizle/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "This is a study app. You can use it as you want. if you understand how it works.you would be able to scale it  ",
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppCircleButton(
                onTap: () => Get.toNamed("/home"),
                child: Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
