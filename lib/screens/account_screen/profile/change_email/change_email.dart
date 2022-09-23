import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangeEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Change Email',
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Email",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldLight(
              isProfileScreen: true,
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.message,
                    height: 20,
                  )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Enter Your New Email',
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "We Will Send verification to your New Email, please check it.",
              style: textTheme.subtitle2!.copyWith(color: colorScheme.primary),
            )
          ],
        ),
      )),
      appBar: CustomAppBar(
        appBarTitle: 'Email',
        arrowBack: true,
      ),
      backgroundColor: colorScheme.background,
    );
  }
}
