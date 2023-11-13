import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizle/bindings/initial_bindings.dart';
import 'package:quizle/configs/themes/app_dark_theme.dart';
import 'package:quizle/configs/themes/app_light_theme.dart';
import 'package:quizle/controllers/theme_controllers.dart';
import 'package:quizle/dataUploaderScreen.dart';
import 'package:quizle/routes/app_routes.dart';
import 'package:quizle/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InitialBindings().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
        getPages: AppRoutes.routes());
  }
}
//This is used to write to our firebase
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }
