import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dotted_line/dotted_line.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
        
          
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppThemes.borderColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Items 3",
                              style: textTheme.labelMedium!.copyWith(
                                  color: AppThemes.greyThree, fontSize: 9.sp)),
                          Text("\$598.86",
                              style: textTheme.labelMedium!.copyWith(
                                  color: colorScheme.primary, fontSize: 9.sp)),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping",
                              style: textTheme.labelMedium!.copyWith(
                                  color: AppThemes.greyThree, fontSize: 9.sp)),
                          Text("\$40.86",
                              style: textTheme.labelMedium!.copyWith(
                                  color: colorScheme.primary, fontSize: 9.sp)),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Import charges",
                              style: textTheme.labelMedium!.copyWith(
                                  color: AppThemes.greyThree, fontSize: 9.sp)),
                          Text("\$128.00",
                              style: textTheme.labelMedium!.copyWith(
                                  color: colorScheme.primary, fontSize: 9.sp)),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor:
                          colorScheme.secondaryContainer.withOpacity(0.4),
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price",
                            style: textTheme.headline2!.copyWith(fontSize: 13)),
                        Text("\$766.86",
                            style: textTheme.headline2!.copyWith(
                                fontSize: 13, color: colorScheme.onPrimary)),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Priscekila",
                          style:
                              textTheme.headline2!.copyWith(fontSize: 10.sp)),
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
                        height: 10,
                      ),
                    ]),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                   border: Border.all(color: Color(0xff40bfff), width: 1, ),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 24.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AssetsPath.creditCard,
                        ),
                        fit: BoxFit.fill))),
          ),
        ]),
      ),
      // bottomNavigationBar: PrimaryElevatedBtn(
      //   buttonText: 'Confirm Order',
      //   onPressed: () {
      //     Navigator.pushNamed(context, Routes.successScreen);
      //   },
      // ),
      // appBar: CustomAppBar(
      //   appBarTitle: 'Confirm Order',
      //   arrowBack: true,
      // ),
      backgroundColor: colorScheme.background,
    );
  }
}
