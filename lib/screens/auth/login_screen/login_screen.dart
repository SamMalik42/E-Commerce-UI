import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/secondary_elevated_btn/secondary_elevated.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              "Welcome to I-Shoppin",
              textAlign: TextAlign.center,
              style: textTheme.headline2!.copyWith(fontSize: 13.sp),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Sign in to continue",
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
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: textTheme.headline2!.copyWith(fontSize: 9.sp),
                ),
              ],
            ),
            _sizedBox(),
            PrimaryElevatedBtn(
                buttonText: "Sign In",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.shoppingApp, (route) => false);
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
            SecondaryElevatedBtn(
              buttonText: 'Login with Google',
              onPressed: () {},
              leadingIcon: AssetsPath.google,
            ),
            SecondaryElevatedBtn(
              buttonText: 'Login with facebook',
              onPressed: () {},
              leadingIcon: AssetsPath.facebook,
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
                    "Don’t have an account? ",
                    style: textTheme.labelMedium!.copyWith(fontSize: 10.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signUpScreen);
                  },
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: textTheme.headline2!.copyWith(fontSize: 10.sp),
                  ),
                )
              ],
            )
          ]),
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
