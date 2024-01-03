import 'package:flutter/material.dart';
import 'package:quizle/package/seperator.dart';
import 'package:quizle/package/shimmer.dart';

class QuestionScreenPlaceHolder extends StatelessWidget {
  const QuestionScreenPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
        width: double.infinity,
        height: 12.0,
        color: Theme.of(context).scaffoldBackgroundColor);

    var answer = Container(
        width: double.infinity,
        height: 12.0,
        color: Theme.of(context).scaffoldBackgroundColor);

    return AdvancedShimmer(duration: Duration(seconds: 5),gradientColors: [
      const Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 9, 5, 92).withOpacity(0.5),
       Color.fromARGB(255, 7, 33, 165).withOpacity(0.8),

    ],child: EasySeparatedColumn(
      separatorType: SeparatorType.vertical,
      separatorThickness: 20,
      animationDuration: Duration(seconds: 4),
      children: [
        EasySeparatedColumn(
          separatorMargin: EdgeInsets.only(
            bottom: 20,
          ) 
          ,children: [
        line,
        line,
        line,
        line
        ]),
answer,
answer,
answer
    ],));
  }
}
