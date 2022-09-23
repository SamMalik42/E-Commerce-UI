import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/secondary_elevated_btn/secondary_elevated.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 90,
            ),
            Center(
              child: Image.asset(
                AssetsPath.logoTwo,
                height: 100,
              ),
            ),
            _sizedBox(),
            Text(
              "Lets Gets Started",
              textAlign: TextAlign.center,
              style: textTheme.headline2!.copyWith(fontSize: 13.sp),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Create an new account",
              textAlign: TextAlign.center,
              style: textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldLight(
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.userIcon,
                    height: 20,
                  )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Full Name',
            ),
            _sizedBox(),
            TextFieldLight(
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
              hintText: 'Your Email',
            ),
            _sizedBox(),
            TextFieldLight(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AssetsPath.call,
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Image.asset(AssetsPath.flag),
                      height: 32,
                      width: 34,
                    )
                  ],
                ),
              ),
              controller: TextEditingController(),
              hintText: 'Phone Number',
            ),
            _sizedBox(),
            TextFieldLight(
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.password,
                    height: 20,
                  )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Password',
            ),
            _sizedBox(),
            TextFieldLight(
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
              hintText: 'Password Again',
            ),
            SizedBox(
              height: 6,
            ),
            _sizedBox(),
            PrimaryElevatedBtn(
                buttonText: "Sign Up",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.otpVerification);
                }),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: colorScheme.secondaryContainer.withOpacity(0.3),
                    height: 0.5,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("OR",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 10.sp,
                        color: colorScheme.secondaryContainer)),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: colorScheme.secondaryContainer.withOpacity(0.3),
                    height: 0.5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            _sizedBox(),
            Column(
              children: [
                Text("Sign up with",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 10.sp,
                        color: colorScheme.secondaryContainer)),
                _sizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _roundedButton(AssetsPath.google),
                    SizedBox(
                      width: 20,
                    ),
                    _roundedButton(AssetsPath.facebook)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    "Already have an account? ",
                    style: textTheme.labelMedium!.copyWith(fontSize: 10.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: textTheme.headline2!.copyWith(fontSize: 10.sp),
                  ),
                )
              ],
            ),
            _sizedBox(),
            _sizedBox(),
          ]),
        ),
      ),
    );
  }

  Container _roundedButton(String path) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xffeaefff),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          path,
          height: 30,
        ),
      ),
    );
  }

  SizedBox _sizedBox() {
    return SizedBox(
      height: 10,
    );
  }
}
