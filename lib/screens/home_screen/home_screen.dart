import 'dart:ui';

import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/constants/constants.dart';
import 'package:iShoppin/screens/home_screen/product_detail/product_detail.dart';
import 'package:iShoppin/services/app_themes/app_themes.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/product_card/product_card.dart';
import 'package:iShoppin/widgets/product_card/recomend_product.dart';
import 'package:iShoppin/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _appBar(colorScheme),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Banners Slider
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 16 / 10,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          currentBannerIndex = index;

                          setState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Constants.sliderImages[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: Constants.sliderImages.length),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: DotsIndicator(
                      dotsCount: Constants.sliderImages.length,
                      position: currentBannerIndex.toDouble(),
                      decorator: DotsDecorator(
                          color: colorScheme.secondary
                              .withOpacity(0.2), // Inactive color
                          activeColor: colorScheme.primary),
                    ),
                  ),
                  _buildListTile(textTheme, colorScheme, "Category", "View All",
                      () {
                    Navigator.pushNamed(context, Routes.categoriesScreen);
                  }),
                  SizedBox(
                    height: 15,
                  ),

                  ///[Category Of Items]
                  Container(
                    height: 12.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: Constants.categoriesNames.length,
                        itemBuilder: (context, i) => FittedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            Constants.categoriesIconPath[i],
                                            height: 3.h,
                                          )
                                        ]),
                                    width: 20.w,
                                    height: 9.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xffeaefff),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(Constants.categoriesNames[i],
                                      textAlign: TextAlign.center,
                                      style: textTheme.bodyText1!.copyWith(
                                          letterSpacing: 0.50, fontSize: 8.sp)),
                                ],
                              ),
                            )),
                  ),

                  /// [Flash Sale Items]
                  SizedBox(
                    height: 40,
                  ),
                  _buildListTile(
                      textTheme, colorScheme, "Flash Sale", "See More", () {}),
                  SizedBox(
                    height: 15,
                  ),
                    Container(
                    height: 35.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: Constants.flashSaleProductNames.length,
                        itemBuilder: (context, i) {
                          return FittedBox(
                            child: ProductCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                              productName: Constants
                                                  .flashSaleProductNames[i],
                                            )));
                              },
                              productName: Constants.flashSaleProductNames[i],
                              productImage: Constants.megaSaleProductPath[i],
                              productNewPrice: "299,43 le",
                              productPrice: "534,33 le",
                              productSalePercent: "24% Off",
                            ),
                          );
                        }),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: 35.h,
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       physics: BouncingScrollPhysics(),
                  //       itemCount: Constants.flashSaleProductNames.length,
                  //       itemBuilder: (context, i) {
                  //         return FittedBox(
                  //           child: Stack(
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.symmetric(horizontal: 5),
                  //                 child: ProductCard(
                  //                   onTap: () {
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) =>
                  //                                 ProductDetails(
                  //                                   productName: Constants
                  //                                       .flashSaleProductNames[i],
                  //                                 )));
                  //                   },
                  //                   productName:
                  //                       Constants.flashSaleProductNames[i],
                  //                   productImage:
                  //                       Constants.flashSaleProductPath[i],
                  //                   productNewPrice: "299,43 le",
                  //                   productPrice: "534,33 le",
                  //                   productSalePercent: "24% Off",
                  //                 ),
                  //               ),
                  //               Positioned(
                  //                 right: i == 1 ? 50 : 0,
                  //                 top: i == 1 ? 50 : 50,
                  //                 child: Image.asset(Constants.circles[i]),
                  //                 height: 7.h,
                  //               )
                  //             ],
                  //           ),
                  //         );
                  //       }),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildListTile(
                      textTheme, colorScheme, "Mega Sale", "See More", () {}),
                  SizedBox(
                    height: 15,
                  ),

                  ///[Mega Sale Product]
                  Container(
                    height: 35.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: Constants.flashSaleProductNames.length,
                        itemBuilder: (context, i) {
                          return FittedBox(
                            child: ProductCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                              productName: Constants
                                                  .flashSaleProductNames[i],
                                            )));
                              },
                              productName: Constants.flashSaleProductNames[i],
                              productImage: Constants.megaSaleProductPath[i],
                              productNewPrice: "299,43 le",
                              productPrice: "534,33 le",
                              productSalePercent: "24% Off",
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///[Recommended Product]
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 16 /9.5 ,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          currentBannerIndex = index;

                          setState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AssetsPath.recommended,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: Constants.sliderImages.length),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: RecoProductCard(
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
                          productImage: Constants.megaSaleProductPath[0],
                          productNewPrice: "299,43 le",
                          productPrice: "534,33 le",
                          productSalePercent: "24% Off",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RecoProductCard(
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
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: RecoProductCard(
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RecoProductCard(
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

    Widget _buildListTile(TextTheme textTheme, ColorScheme colorScheme,
      String titleOne, String titleTwo, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleOne,
            style: textTheme.headline1!.copyWith(fontSize: 11.sp),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.primary)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Text(
                  titleTwo,
                  style: textTheme.bodyText1!
                      .copyWith(color: colorScheme.primary, fontSize: 10.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _appBar(ColorScheme colorScheme) {
    return Container(
        child: SafeArea(
          child: Row(children: [
            SizedBox(width: 15),
            Expanded(
                child: CustomTextField(
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.searchIc,
                    height: 20,
                  )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Search Product',
            )),
            SizedBox(width: 15),
            Icon(
              Icons.favorite_outline,
              color: colorScheme.background,
              size: 22,
            ),
            SizedBox(width: 15),
            Stack(
              children: [
                SvgPicture.asset(
                  AssetsPath.notification,
                  color: colorScheme.background,
                  height: 22,
                ),
                Positioned(
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorScheme.onPrimary),
                    height: 9,
                    width: 9,
                  ),
                )
              ],
            ),
            SizedBox(width: 15),
          ]),
        ),
        width: double.infinity,
        height: 12.h,
        decoration: BoxDecoration(
          gradient: AppThemes.primaryGradient,
        ));
  }
}
