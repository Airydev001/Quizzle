import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  const AppIconText({super.key, required this.icon, required this.Text});

  final Icon icon;
  final Widget Text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
         const  SizedBox(
          width: 4,
        )
      ],
    );
  }
}
