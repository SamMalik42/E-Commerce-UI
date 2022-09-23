import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyPointsScreen extends StatelessWidget {
  const MyPointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              "to know more information about the points and reward system please  ",
                          style: textTheme.subtitle2!.copyWith(
                              color: AppThemes.greyThree,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp)),
                      TextSpan(
                          text: "Click Here",
                          style: textTheme.subtitle2!.copyWith(
                              decoration: TextDecoration.underline,
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp)),
                    ])),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      appBar: CustomAppBar(
        arrowBack: true,
        appBarTitle: "My Points",
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "You have made",
                  style: textTheme.subtitle2!.copyWith(
                      color: AppThemes.greyThree,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp)),
              TextSpan(
                  text: "  5 Orders",
                  style: textTheme.headline1!.copyWith(fontSize: 11.sp)),
              TextSpan(
                  text: " till know",
                  style: textTheme.subtitle2!.copyWith(
                      color: AppThemes.greyThree,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp)),
            ])),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(AssetsPath.win, height: 18.h),
          SizedBox(
            height: 30,
          ),
          Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "You won",
                      style: textTheme.subtitle2!.copyWith(
                          color: AppThemes.greyThree,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp)),
                  TextSpan(
                      text: "  200 points",
                      style: textTheme.headline1!.copyWith(
                          fontSize: 11.sp, color: colorScheme.onPrimary)),
                  TextSpan(
                      text:
                          " as a reward\n and you can use them through the checkout",
                      style: textTheme.subtitle2!.copyWith(
                          color: AppThemes.greyThree,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp)),
                ])),
          ),
        ],
      )),
    );
  }
}
