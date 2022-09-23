import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../assets_path/assets_path.dart';

class SettingsScreen extends StatelessWidget {
  final List<String> settingsOptions = [
    "Language",
    "Country",
    "Contact us",
    "About I-Shoppin",
    "Terms and Conditions",
    "Delete Account",
    "Sign Out"
  ];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Settings',
        arrowBack: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ...List.generate(
              settingsOptions.length,
              (index) => ListTile(
                    onTap: () {
                      switch (index) {
                        case 2:
                          Navigator.pushNamed(context, Routes.contactUs);
                          break;
                        case 5:
                          Navigator.pushNamed(context, Routes.deleteAccount);
                          break;
                        case 6:
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _signOutDialog(textTheme, context));
                          break;
                        default:
                      }
                    },
                    title: Text(settingsOptions[index],
                        style: textTheme.headline1!.copyWith(
                          fontSize: 9.sp,
                          color: index != 5
                              ? AppThemes.greyThree
                              : AppThemes.colorRed,
                        )),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: colorScheme.secondaryContainer,
                    ),
                  ))
        ],
      )),
      backgroundColor: colorScheme.background,
    );
  }

  Dialog _signOutDialog(TextTheme textTheme, BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(AssetsPath.cross, height: 25),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Image.asset(AssetsPath.signOut, height: 30),
            SizedBox(
              height: 5,
            ),
            Text(
              "Sign Out",
              style: textTheme.headline2!.copyWith(fontSize: 15.sp),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Are you sure wanna  sign out ?",
              style: textTheme.bodyText1,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryElevatedBtn(
                buttonText: 'Sign Out',
                onPressed: () {},
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel",
                    textAlign: TextAlign.center, style: textTheme.headline5)),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
