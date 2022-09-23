import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryElevatedBtn extends StatelessWidget {
  final String buttonText;
  final bool buttonTypeTwo;
  final VoidCallback onPressed;

  PrimaryElevatedBtn({
    required this.buttonText,
    this.buttonTypeTwo = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 14),
        decoration: buttonTypeTwo == false
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: AppThemes.primaryGradient,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppThemes.colorRed,
              ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(buttonText,
                style: textTheme.headline2!
                    .copyWith(color: colorScheme.background, fontSize: 12.sp)),
          ),
        ),
      ),
    );
  }
}
