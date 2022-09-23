import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AssetsPath.success,
                    height: 20.h,
                  ),
                ),
                Text(
                  "Success",
                  style: textTheme.headline2!.copyWith(fontSize: 15.sp),
                ),
                Text(
                  "thank you for shopping using with I-Shoppin",
                  style: textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryElevatedBtn(
                  buttonText: 'Back to Home',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.shoppingApp, (route) => false);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
