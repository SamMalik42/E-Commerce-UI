import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/constants/constants.dart';
import 'package:iShoppin/screens/home_screen/product_detail/product_detail.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/product_card/recomend_product.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dotted_line/dotted_line.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
       bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Check Out',
        onPressed: () {
          Navigator.pushNamed(context, Routes.shipTo);
        },
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _card(textTheme, colorScheme),
                SizedBox(
                  height: 20,
                ),
                _card(textTheme, colorScheme),
                SizedBox(
                  height: 20,
                ),
                TextFieldLight(
                  isProfileScreen: true,
                  suffixIcon: Container(
                    child: Center(
                        child: Text("Apply",
                            style: textTheme.headline1!.copyWith(
                                color: Colors.white, fontSize: 10.sp))),
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(5),
                      ),
                      gradient: AppThemes.primaryGradient,
                    ),
                  ),
                  controller: TextEditingController(),
                  hintText: '   Enter Coupon Code',
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Use my current points (50 Points)",
                        style: textTheme.headline2!.copyWith(
                          color: colorScheme.secondaryContainer,
                          fontSize: 10.sp,
                        )),
                  ],
                ),
               
                SizedBox(
                  height: 5,
                ),
                Container(
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
                                      color: AppThemes.greyThree,
                                      fontSize: 9.sp)),
                              Text("\$598.86",
                                  style: textTheme.labelMedium!.copyWith(
                                      color: colorScheme.primary,
                                      fontSize: 9.sp)),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping",
                                  style: textTheme.labelMedium!.copyWith(
                                      color: AppThemes.greyThree,
                                      fontSize: 9.sp)),
                              Text("\$40.86",
                                  style: textTheme.labelMedium!.copyWith(
                                      color: colorScheme.primary,
                                      fontSize: 9.sp)),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Import charges",
                                  style: textTheme.labelMedium!.copyWith(
                                      color: AppThemes.greyThree,
                                      fontSize: 9.sp)),
                              Text("\$128.00",
                                  style: textTheme.labelMedium!.copyWith(
                                      color: colorScheme.primary,
                                      fontSize: 9.sp)),
                            ]),
                            SizedBox(
                          height: 16,
                        ),
                             DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: colorScheme.secondaryContainer,
                
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
                                style: textTheme.headline2!
                                    .copyWith(fontSize: 13)),
                            Text("\$766.86",
                                style: textTheme.headline2!.copyWith(
                                    fontSize: 13,
                                    color: colorScheme.onPrimary)),
                          ],
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Viewed Products",
                    style: textTheme.headline1!.copyWith(fontSize: 11.sp)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          RecoProductCard(
                            isCheckout: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            productName: Constants
                                                .flashSaleProductNames[0],
                                          )));
                            },
                            haveRatings: true,
                            productName: Constants.flashSaleProductNames[0],
                            productImage: Constants.megaSaleProductPath[1],
                            productNewPrice: "299,43 le",
                            productPrice: "534,33 le",
                            productSalePercent: "24% Off",
                          ),
                          _addToCartButton(textTheme)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RecoProductCard(
                            isCheckout: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            productName: Constants
                                                .flashSaleProductNames[0],
                                          )));
                            },
                            haveRatings: true,
                            productName: Constants.flashSaleProductNames[0],
                            productImage: Constants.megaSaleProductPath[2],
                            productNewPrice: "299,43 le",
                            productPrice: "534,33 le",
                            productSalePercent: "24% Off",
                          ),
                          _addToCartButton(textTheme)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      appBar: CustomAppBar(
        appBarTitle: "Cart",
      ),
    );
  }

  Container _addToCartButton(TextTheme textTheme) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(AssetsPath.addSign, height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Add to cart",
                style: textTheme.headline1!.copyWith(fontSize: 10.sp),
              ),
            ),
          )
        ],
      ),
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        border: Border.all(
          color: AppThemes.borderColor,
          width: 1,
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _card(TextTheme textTheme, ColorScheme colorScheme) {
    return Container(
      height: 19.h,
      child: Stack(fit: StackFit.expand, children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 17.h,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(AssetsPath.p4, height: 13.h),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike Air Zoom Pegasus\n36 Miami",
                          textAlign: TextAlign.start,
                          style: textTheme.headline2!.copyWith(
                            color: colorScheme.primary,
                            fontSize: 9.sp,
                            letterSpacing: 0.50,
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child:
                              Image.asset(AssetsPath.heartIcon2, height: 22)),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(AssetsPath.deleteIcon2, height: 22),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text("Unit Price",
                          style: textTheme.labelMedium!.copyWith(
                              fontSize: 9.sp, color: AppThemes.greyThree)),
                      SizedBox(
                        width: 3,
                      ),
                      Text("299,43 le",
                          style: textTheme.labelMedium!.copyWith(
                              fontSize: 9.sp,
                              color:
                                  AppThemes.lightTextColor.withOpacity(0.7))),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total",
                          style: textTheme.labelMedium!.copyWith(
                              fontSize: 9.sp, color: AppThemes.greyThree)),
                      SizedBox(
                        width: 3,
                      ),
                      Text("299,43 le",
                          style: textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: colorScheme.onPrimary)),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: colorScheme.secondaryContainer
                                    .withOpacity(0.4))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.remove_outlined,
                              color: colorScheme.secondaryContainer,
                            ),
                            Container(
                              child: Center(
                                  child: Text(
                                "1",
                                style: textTheme.bodyText1!.copyWith(
                                    color: colorScheme.secondaryContainer),
                              )),
                              width: 41,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffeaefff),
                                  width: 1,
                                ),
                                color: Color(0xffeaefff),
                              ),
                            ),
                            Icon(
                              Icons.add_outlined,
                              color: colorScheme.secondaryContainer,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppThemes.lightColor,
              width: 1,
            ),
            color: Colors.white,
          ),
        ),
        Positioned(
            top: 6,
            left: 17,
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(AssetsPath.tropy, height: 18),
                  SizedBox(
                    width: 5,
                  ),
                  Text("20 points",
                      style: textTheme.bodyText1!
                          .copyWith(color: AppThemes.darkGrey, fontSize: 9.sp)),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppThemes.pointColor,
              ),
            ))
      ]),
    );
  }
}
