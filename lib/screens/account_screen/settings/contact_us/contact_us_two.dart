import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactUsTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
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
              "thank you for Contacting with I-Shoppin",
              style: textTheme.bodyText1,
            ),
            SizedBox(
              height: 70,
            ),
            PrimaryElevatedBtn(
              buttonText: 'Send another Message',
              onPressed: () {},
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Back to Setting",
                    textAlign: TextAlign.center, style: textTheme.headline5))
          ],
        ),
      )),
      appBar: CustomAppBar(
        appBarTitle: 'Contact Us',
        arrowBack: true,
      ),
    );
  }
}
