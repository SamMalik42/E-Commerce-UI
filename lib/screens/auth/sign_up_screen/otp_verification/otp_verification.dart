import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar:
          PrimaryElevatedBtn(buttonText: "Verify", onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
          }),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 80,
        ),
        Center(child: Image.asset(AssetsPath.otp, height: 32.h)),
        SizedBox(
          height: 36,
        ),
        Text(
          "OTP Verification",
          style: textTheme.headline4!.copyWith(fontSize: 16.sp),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Enter the OTP sent to",
              style: textTheme.bodyText1!
                  .copyWith(fontSize: 12.sp, color: AppThemes.lightTextColor)),
          TextSpan(
              text: " +234 706 067 2335",
              style: textTheme.headline4!
                  .copyWith(fontSize: 12.sp, color: AppThemes.lightTextColor)),
        ])),
        SizedBox(
          height: 50,
        ),
        OTPTextField(
          otpFieldStyle: OtpFieldStyle(focusBorderColor: colorScheme.primary),
          fieldWidth: 55,
          length: 4,
          width: MediaQuery.of(context).size.width,
          style: textTheme.bodyText1!
              .copyWith(color: Colors.black, fontSize: 12.sp),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            print("Completed: " + pin);
          },
        ),
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.50,
              child: Text(
                "Didn’t you receive the OTP?  ",
                style: textTheme.labelMedium!.copyWith(fontSize: 9.sp),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend OTP",
                textAlign: TextAlign.center,
                style: textTheme.headline2!.copyWith(fontSize: 10.sp),
              ),
            )
          ],
        )
      ])),
    );
  }
}
