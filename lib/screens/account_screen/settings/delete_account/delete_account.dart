import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DeleteAccount extends StatefulWidget {
  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final bool password = true;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonTypeTwo: true,
        buttonText: 'Deleted Account',
        onPressed: () {
          showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: (){
                                                     Navigator.pop(context);
                                                  },
                                                  child: Image.asset(AssetsPath.cross,
                                                      height: 25),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 70,
                                          ),
                                          Image.asset(AssetsPath.delete,
                                              height: 30),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Delete Account",
                                            style: textTheme.headline2!
                                                .copyWith(fontSize: 15.sp),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Are you sure wanna delete account ?",
                                            style: textTheme.bodyText1,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: PrimaryElevatedBtn(
                                              buttonTypeTwo: true,
                                              buttonText: 'Delete',
                                              onPressed: () {

                                                
                                              },
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                
                                              },
                                              child: Text("Cancel",
                                                  textAlign: TextAlign.center,
                                                  style: textTheme.headline5)),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
        },
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter your password",
                style: textTheme.subtitle2!
                    .copyWith(color: AppThemes.greyThree, fontSize: 10.sp)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldLight(
              suffixIcon: GestureDetector(
                  onTap: () {
                    password == !password;
                    setState(() {});
                  },
                  child: getEyeIcon(password)),
              isProfileScreen: true,
              isObsecure: password,
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
              height: 25,
            ),
          ],
        ),
      )),
      appBar: CustomAppBar(
        arrowBack: true,
        appBarTitle: 'Delete Account',
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
