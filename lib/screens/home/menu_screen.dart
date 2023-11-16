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
                    padding:  EdgeInsets.only(
                      right: MediaQuery.of(context).size.width*0.3,
                      top: MediaQuery.of(context).size.height*0.2
                    ),
                    child: Column(
                      children: [
                        Obx(() => controller.user.value == null?
                        const SizedBox(
                  
                        ) : Text(
                      controller.user.value!.displayName??'' ,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: onSurfaceTextColor
                      ),   
                        )
                        )
                      ],
                    ),
                  )
            ],
          ))),
    );
  }
}


// class DrawerButton extends StatelessWidget {
//   const DrawerButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(onPressed: ()=>null , icon: icon, label: label)
//   }
// }