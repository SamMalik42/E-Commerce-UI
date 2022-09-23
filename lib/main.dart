import 'dart:developer';

import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/constants/constants.dart';
import 'package:iShoppin/screens/account_screen/account_screen.dart';
import 'package:iShoppin/screens/home_screen/categories_screen/categories_screen.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/checkout_screen.dart';
import 'package:iShoppin/screens/home_screen/home_screen.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Sizer(
    builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: ShoppingApp(),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.onboardingScreen,
        theme: AppThemes.primaryMaterialTheme,
      );
    },
  ));
}


class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    List<Widget> screens = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      Container(
        color: Colors.green,
      ),
      AccountScreen()
    ];

    int i = 0;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Scaffold(
          body: screens[i],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            onTap: (idx) {
              log("tap");
              log(idx.toString());
              i = idx;
              setState(
                () {},
              );
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: colorScheme.primary,
            unselectedItemColor: colorScheme.secondaryContainer,
            selectedLabelStyle: TextStyle(
                color: colorScheme.primary,
                fontFamily: Constants.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 8.sp),
            unselectedLabelStyle: TextStyle(
                color: colorScheme.secondaryContainer,
                fontFamily: Constants.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 8.sp),
            currentIndex: i,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    AssetsPath.home,
                    height: 22,
                    color: i == 0
                        ? colorScheme.primary
                        : colorScheme.secondaryContainer,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    AssetsPath.categories,
                    height: 22,
                    color: i == 1
                        ? colorScheme.primary
                        : colorScheme.secondaryContainer,
                  ),
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        AssetsPath.cart,
                        height: 22,
                        color: i == 2
                            ? colorScheme.primary
                            : colorScheme.secondaryContainer,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        child: Center(
                            child: Text(
                          "2",
                          style: textTheme.bodyText1!
                              .copyWith(fontSize: 7, color: Colors.white),
                        )),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: colorScheme.background, width: 1),
                          shape: BoxShape.circle,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    )
                  ],
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    AssetsPath.offer,
                    height: 22,
                    color: i == 3
                        ? colorScheme.primary
                        : colorScheme.secondaryContainer,
                  ),
                ),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    AssetsPath.account,
                    height: 22,
                    color: i == 4
                        ? colorScheme.primary
                        : colorScheme.secondaryContainer,
                  ),
                ),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
