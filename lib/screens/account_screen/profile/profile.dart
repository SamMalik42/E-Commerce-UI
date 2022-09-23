import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.changeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetsPath.demoPic))),
                  ),
                  Text(
                    "Mohamed Bekhit",
                    style: textTheme.headline2!.copyWith(fontSize: 12.sp),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: colorScheme.secondaryContainer,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
              onTap: () {
              Navigator.pushNamed(context, Routes.changePhoneNumber);
            },
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text("(307) 555-0133",
                  textAlign: TextAlign.right, style: textTheme.subtitle2),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: colorScheme.secondaryContainer,
              ),
            ]),
            horizontalTitleGap: 0,
            title: Text(
              "Phone Number",
              style: textTheme.headline2!.copyWith(fontSize: 9.sp),
            ),
            leading: Image.asset(
              AssetsPath.phone,
              height: 26,
            ),
          ),
          
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.changeEmail);
            },
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text("rex4dom@gmail.com",
                  textAlign: TextAlign.right, style: textTheme.subtitle2),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: colorScheme.secondaryContainer,
              ),
            ]),
            horizontalTitleGap: 0,
            title: Text(
              "Email",
              style: textTheme.headline2!.copyWith(fontSize: 9.sp),
            ),
            leading: Image.asset(
              AssetsPath.email,
              height: 26,
            ),
          ),
          
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.changePassword);
            },
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text("•••••••••••••••••",
                  textAlign: TextAlign.right, style: textTheme.subtitle2),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: colorScheme.secondaryContainer,
              ),
            ]),
            horizontalTitleGap: 0,
            title: Text(
              "Change Password",
              style: textTheme.headline2!.copyWith(fontSize: 9.sp),
            ),
            leading: Image.asset(
              AssetsPath.passwordLock,
              height: 20,
            ),
          )
        ],
      )),
      backgroundColor: colorScheme.background,
      appBar: CustomAppBar(
        appBarTitle: 'Profile',
        arrowBack: true,
      ),
    );
  }
}
