import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  final List<String> options = [
    "Profile",
    "My Points",
    "My Orders",
    "Address",
    "Payment",
    "Settings"
  ];

  final List<String> icons = [
    AssetsPath.myProfile,
    AssetsPath.myPoints,
    AssetsPath.myOrder,
    AssetsPath.location,
    AssetsPath.payment,
    AssetsPath.settings
  ];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                icons.length,
                (index) => ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(context, Routes.profileScreen);
                            break;
                          case 1:
                            Navigator.pushNamed(context, Routes.myPointsScreen);
                            break;
                          case 2:
                            Navigator.pushNamed(context, Routes.myOrdersScreen);
                            break;
                          case 3:
                            Navigator.pushNamed(
                                context, Routes.addressesScreen);
                            break;
                          case 4:
                            Navigator.pushNamed(context, Routes.paymentScreen);
                            break;
                          case 5:
                            Navigator.pushNamed(context, Routes.settingsScreen);
                            break;
                          default:
                        }
                      },
                      horizontalTitleGap: 2,
                      title: index != 1
                          ? Text(
                              options[index],
                              style: textTheme.headline3!.copyWith(
                                  fontSize: 9.sp, color: colorScheme.primary),
                            )
                          : Stack(
                              children: [
                                Text(
                                  options[index],
                                  style: textTheme.headline3!.copyWith(
                                      fontSize: 9.sp,
                                      color: colorScheme.primary),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 67,
                                  child: Container(
                                    child: Center(),
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorScheme.onPrimary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                      leading: Image.asset(
                        icons[index],
                        height: 22,
                      ),
                    ))
          ],
        ),
      ),
      appBar: CustomAppBar(
    
        appBarTitle: "Account",
      ),
    );
  }
}
