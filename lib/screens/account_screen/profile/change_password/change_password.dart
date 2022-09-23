import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool oldPasswordObserved = true;
  bool newPasswordObserved = true;
  bool confirmPasswordObserved = true;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Save',
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Old Password",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldLight(
              suffixIcon: GestureDetector(
                  onTap: () {
                    oldPasswordObserved = !oldPasswordObserved;
                    setState(() {});
                  },
                  child: getEyeIcon(oldPasswordObserved)),
              isProfileScreen: true,
              isObsecure: oldPasswordObserved,
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
              hintText: 'Enter Old Password',
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "New Password",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldLight(
              suffixIcon: GestureDetector(
                  onTap: () {
                    newPasswordObserved = !newPasswordObserved;
                    setState(() {});
                  },
                  child: getEyeIcon(newPasswordObserved)),
              isProfileScreen: true,
              isObsecure: newPasswordObserved,
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
              hintText: 'Enter New Password',
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "New Password Again",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldLight(
              suffixIcon: GestureDetector(
                  onTap: () {
                    confirmPasswordObserved = !confirmPasswordObserved;
                    setState(() {});
                  },
                  child: getEyeIcon(confirmPasswordObserved)),
              isProfileScreen: true,
              isObsecure: confirmPasswordObserved,
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
              hintText: 'Confirm Password',
            ),
          ],
        ),
      )),
      appBar: CustomAppBar(
        appBarTitle: 'Change Password',
        arrowBack: true,
      ),
      backgroundColor: colorScheme.background,
    );
  }

  Widget getEyeIcon(bool obSecure) {
    return obSecure
        ? Icon(
            Icons.visibility_off_outlined,
            color: Color(0xffADADAD),
          )
        : Icon(
            Icons.visibility_outlined,
            color: Color(0xffADADAD),
          );
  }
}
