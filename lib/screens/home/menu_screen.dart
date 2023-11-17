import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizle/configs/themes/app_colors.dart';
import 'package:quizle/configs/themes/ui_parameters.dart';
import 'package:quizle/controllers/zoom_drawer.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
            ),
          ),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.2,
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(controller.user.value!.photoURL!),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor),
                          )),
                    Spacer(
                      flex: 1,
                    ),
                    DrawerButton(
                      label: "website",
                      onPressed: () => controller.website(),
                    ),
                    DrawerButton(
                      label: "facebook",
                      onPressed: () => controller.facebook(),
                    ),
                    DrawerButton(
                      label: "email",
                      onPressed: () => controller.email(),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    DrawerButton(
                      label: "log out",
                      onPressed: () => controller.signOut(),
                    )
                  ],
                ),
              )
            ],
          ))),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({super.key, required this.label, this.onPressed});

  final String label;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
