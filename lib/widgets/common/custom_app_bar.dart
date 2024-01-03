import 'package:flutter/material.dart';
import 'package:quizle/configs/themes/app_icons.dart';
import 'package:quizle/configs/themes/custom_text_styles.dart';
import 'package:quizle/configs/themes/ui_parameters.dart';
import 'package:quizle/widgets/app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.leading,
      this.titleWidget,
      this.showActionIcon = false,
      this.onMenuActionTap});

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: mobileScreenPadding,
          vertical: mobileScreenPadding,
        ),
        child: Stack(
          children: [
            Positioned.fill(child: 
            titleWidget==null?Center(
              child: Text(
                title, style: appBarTS,
              )
            )
            :Center(
              child: titleWidget,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              leading??Transform.translate(offset: Offset(-14, 0),
              child: BackButton(),
              ),
              if(showActionIcon)
              Transform.translate(offset: Offset(10, 0),
              child: AppCircleButton(
                child: const Icon(Icons.menu_sharp,size: 20,),
                onTap: onMenuActionTap??null,
              ),
              )
            ],)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
    double.maxFinite,
   80);
}