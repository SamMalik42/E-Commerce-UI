import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentMethods extends StatefulWidget {
  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool toggle = false;
  bool isCard = false;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Choose the payment Method",
              style: textTheme.bodyText1!.copyWith(color: AppThemes.darkGrey),
            ),
          ),
        
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pay with CASH",
                  style: textTheme.headline4!
                      .copyWith(color: colorScheme.primary, fontSize: 10.sp),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoSwitch(
                value: toggle,
                onChanged: (value) {
                  toggle = !value;
                  setState(() {});
                },
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: colorScheme.secondaryContainer.withOpacity(0.4),
              height: 1,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Or pay with CARD",
              style: textTheme.bodyText1!.copyWith(color: AppThemes.darkGrey),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () {
              isCard = !isCard;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: isCard
                          ? Border.all(
                              color: Color(0xff787775),
                              width: 4,
                            )
                          : null,
                      image: DecorationImage(
                          image: AssetImage(
                            AssetsPath.creditCard,
                          ),
                          fit: BoxFit.fill))),
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
                    "Add Card",
                    style: textTheme.bodyText1!
                        .copyWith(color: AppThemes.darkGrey),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      // bottomNavigationBar: PrimaryElevatedBtn(
      //   buttonText: 'Next',
      //   onPressed: () {
      //     Navigator.pushNamed(context, Routes.confirmOrder);
      //   },
      // ),
      // appBar: CustomAppBar(appBarTitle: 'Payment Method', arrowBack: true),
      backgroundColor: colorScheme.background,
    );
  }
}
