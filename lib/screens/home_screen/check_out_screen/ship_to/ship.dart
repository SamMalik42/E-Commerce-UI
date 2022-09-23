import 'dart:developer';

import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/confirm_order/confirm_order.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/payment_method/payment_method.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShipTo extends StatefulWidget {
  @override
  State<ShipTo> createState() => _ShipToState();
}

class _ShipToState extends State<ShipTo> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0);
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          currentPage == 0
              ? Center(child: Image.asset(AssetsPath.ship1, height: 11.h))
              : currentPage == 1
                  ? Center(
                      child:
                          Image.asset(AssetsPath.paymentMethod, height: 11.h))
                  : Center(
                      child:
                          Image.asset(AssetsPath.confirmOrder, height: 11.h)),
          SizedBox(height: 14),
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                currentPage = value;
                setState(() {});
              },
              controller: pageController,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Choose the shipping address",
                        style: textTheme.bodyText1!
                            .copyWith(color: AppThemes.darkGrey),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Priscekila",
                                    style: textTheme.headline2!
                                        .copyWith(fontSize: 10.sp)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
                                  style: TextStyle(
                                    color: colorScheme.secondaryContainer,
                                    fontSize: 9.sp,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "+99 1234567890",
                                  style: TextStyle(
                                    color: colorScheme.secondaryContainer,
                                    fontSize: 9.sp,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 14),
                                          child: Text("Edit",
                                              style: textTheme.headline2!
                                                  .copyWith(
                                                      color: colorScheme
                                                          .background,
                                                      fontSize: 12.sp)),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          gradient: AppThemes.primaryGradient,
                                        )),
                                    Image.asset(
                                      AssetsPath.delete2,
                                      height: 25,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ]),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppThemes.lightColor,
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetsPath.addThree, height: 60),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Add Address",
                              style: textTheme.bodyText1!
                                  .copyWith(color: AppThemes.darkGrey),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ConfirmOrder(),
                PaymentMethods(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Next',
        onPressed: () {
          log(currentPage.toString());
          pageController.animateToPage(currentPage <= 1 ? currentPage + 1 : 2,
              duration: Duration(milliseconds: 500), curve: Curves.bounceOut);

          if (currentPage == 2) {
            Navigator.pushNamed(context, Routes.successScreen);
          }
        },
      ),
      appBar: CustomAppBar(
        appBarTitle: currentPage == 0
            ? 'Ship To'
            : currentPage == 1
                ? "Payment Method"
                : "Confirm Order",
        arrowBack: true,
        onPressed: () {
          if (currentPage != 0) {
            pageController.previousPage(
                duration: Duration(milliseconds: 500), curve: Curves.bounceOut);
          } else {
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: colorScheme.background,
    );
  }
}
