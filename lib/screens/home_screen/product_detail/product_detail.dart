import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/constants/constants.dart';
import 'package:iShoppin/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';

class ProductDetails extends StatefulWidget {
  String? productName;
  String? productImage;

  ProductDetails({this.productName, this.productImage});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentBannerIndex = 0;

  int selectedSizeIndex = 2;
  List<Color> colors = [
    Color(0xffffc732),
    Color(0xff40bfff),
    Color(0xfffb7181),
    Color(0xff53d1b6)
  ];

  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            AssetsPath.cart,
            height: 30,
            color: colorScheme.background,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            "Go To Cart",
            style: textTheme.headline1!
                .copyWith(fontSize: 12.sp, color: colorScheme.background),
          )
        ]),
        margin: EdgeInsets.all(20),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff233a72), Color(0xff435789)],
          ),
        ),
      ),
      body: Column(children: [
        _header(context, colorScheme, textTheme),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
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
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    Constants.flashSaleProductPath[index],
                                  ),
                                  fit: BoxFit.cover)),
                        );
                      },
                      itemCount: Constants.flashSaleProductPath.length),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: DotsIndicator(
                      dotsCount: Constants.flashSaleProductPath.length,
                      position: currentBannerIndex.toDouble(),
                      decorator: DotsDecorator(
                          color: colorScheme.secondary
                              .withOpacity(0.2), // Inactive color
                          activeColor: colorScheme.primary),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.productName!,
                          maxLines: 4,
                          style: textTheme.headline2!.copyWith(
                            color: Color(0xff223263),
                            fontSize: 12.sp,
                            letterSpacing: 0.50,
                          )),
                      Icon(
                        Icons.favorite_outline,
                        color: colorScheme.secondaryContainer,
                      )
                    ],
                  ),
                  _sizedBox(),
                  _ratingStars(colorScheme),
                  _sizedBox(),
                  _sizedBox(),
                  Text(
                    "299,43 le",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 13.sp,
                        letterSpacing: 0.50,
                        color: colorScheme.onSecondary),
                  ),
                  _sizedBox(),
                  _sizedBox(),
                  _buildTitle(textTheme, "Select Size"),
                  _sizedBox(),

                  ///[Size Containers]
                  Container(
                    height: 60,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Constants.size.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              selectedSizeIndex = i;
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                child: Center(
                                  child: Text(Constants.size[i],
                                      style: textTheme.headline2!.copyWith(
                                        color: Color(0xff223263),
                                        fontSize: 10.sp,
                                        letterSpacing: 0.50,
                                      )),
                                ),
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedSizeIndex == i
                                        ? colorScheme.primary
                                        : Color(0xffeaefff),
                                    width: 1,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  _sizedBox(),
                  _sizedBox(),
                  _buildTitle(textTheme, "Select Color"),
                  _sizedBox(),

                  ///[Select Color Containers]
                  Container(
                    height: 60,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              selectedColor = i;
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                child: selectedColor == i
                                    ? Center(
                                        child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          color: Colors.white,
                                        ),
                                      ))
                                    : SizedBox(),
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors[i],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  _sizedBox(),
                  _sizedBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitle(textTheme, "Description"),
                      Text(
                        "CD0113-400",
                        textAlign: TextAlign.right,
                        style: textTheme.bodyText2!.copyWith(
                          color: colorScheme.secondaryContainer,
                          fontSize: 12,
                          letterSpacing: 0.50,
                        ),
                      )
                    ],
                  ),
                  _sizedBox(),
                  Text(
                    Constants.description,
                    style: textTheme.bodyText2!.copyWith(
                      color: colorScheme.secondaryContainer,
                      fontSize: 9.sp,
                      letterSpacing: 0.50,
                    ),
                  ),
                  _sizedBox(),
                  _sizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitle(textTheme, "Review Product"),
                      Text("See All Reviews",
                          textAlign: TextAlign.right,
                          style: textTheme.bodyText2!.copyWith(
                            color: Color(0xff233a72),
                            decoration: TextDecoration.underline,
                            fontSize: 11.sp,
                            letterSpacing: 0.50,
                          ))
                    ],
                  ),
                  _sizedBox(),
                  Row(
                    children: [
                      _ratingStars(colorScheme),
                      SizedBox(
                        width: 3,
                      ),
                      Text("4.5",
                          style: textTheme.headline2!.copyWith(
                            color: colorScheme.secondaryContainer,
                            fontSize: 9.sp,
                            letterSpacing: 0.50,
                          )),
                      SizedBox(
                        width: 3,
                      ),
                      Text("(5 Review)",
                          textAlign: TextAlign.right,
                          style: textTheme.bodyText2!.copyWith(
                            color: colorScheme.secondaryContainer,
                            fontSize: 12,
                            letterSpacing: 0.50,
                          )),
                    ],
                  ),
                  _sizedBox(),
                  _sizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(AssetsPath.user, height: 60),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "James Lawson",
                                style: textTheme.headline1!.copyWith(
                                    fontSize: 11.sp, color: Color(0xff223263)),
                              ),
                              _ratingStars(colorScheme),
                            ],
                          ),
                        ],
                      ),
                      _sizedBox(),
                      Text(
                        "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites",
                        style: textTheme.bodyText2!.copyWith(
                          color: colorScheme.secondaryContainer,
                          fontSize: 9.sp,
                          letterSpacing: 0.50,
                        ),
                      ),
                      _sizedBox(),
                      Text(
                        "December 10, 2016",
                        style: textTheme.bodyText2!.copyWith(
                          color: colorScheme.secondaryContainer,
                          fontSize: 9.sp,
                          letterSpacing: 0.50,
                        ),
                      ),
                      _sizedBox(),
                      _sizedBox(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: colorScheme.primary, width: 1)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_outlined,
                                color: colorScheme.primary,
                              ),
                              Text(
                                "Add your Review",
                                style: textTheme.bodyText1!
                                    .copyWith(color: colorScheme.primary),
                              )
                            ],
                          ),
                        ),
                      ),
                      _sizedBox(),
                      _sizedBox(),
                      _buildListTile(textTheme, colorScheme, "Viewed Products",
                          "See All", () {}),
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: ProductCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                    productName: Constants
                                                        .flashSaleProductNames[i],
                                                  )));
                                    },
                                    productName:
                                        Constants.flashSaleProductNames[i],
                                    productImage:
                                        Constants.megaSaleProductPath[i],
                                    productNewPrice: "299,43 le",
                                    productPrice: "534,33 le",
                                    productSalePercent: "24% Off",
                                  ),
                                ),
                              );
                            }),
                      ),
                      _sizedBox(),
                      _sizedBox(),
                      Text(
                        "Best Seller Products",
                        style: textTheme.headline1!.copyWith(fontSize: 11.sp),
                      ),
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: ProductCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                    productName: Constants
                                                        .flashSaleProductNames[i],
                                                  )));
                                    },
                                    productName:
                                        Constants.flashSaleProductNames[i],
                                    productImage:
                                        Constants.megaSaleProductPath[i],
                                    productNewPrice: "299,43 le",
                                    productPrice: "534,33 le",
                                    productSalePercent: "24% Off",
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  _sizedBox(),
                  _sizedBox(),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Row _ratingStars(ColorScheme colorScheme) {
    return Row(
      children: [
        ...List.generate(
          3,
          (i) => Icon(
            Icons.star_outlined,
            size: 2.5.h,
            color: colorScheme.onPrimary,
          ),
        ),
        Icon(
          Icons.star_outlined,
          size: 2.5.h,
          color: colorScheme.secondaryContainer.withOpacity(0.2),
        ),
      ],
    );
  }

  Text _buildTitle(TextTheme textTheme, String title) {
    return Text(
      title,
      style: textTheme.headline1!.copyWith(fontSize: 11.sp),
    );
  }

  SizedBox _sizedBox() {
    return SizedBox(
      height: 10,
    );
  }

  Container _header(
      BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: colorScheme.background,
                  )),
              Text(
                widget.productName!,
                style: textTheme.headline3!.copyWith(fontSize: 13.sp),
              ),
            ]),
          ),
        ),
        width: double.infinity,
        height: 15.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff233a72), Color(0xff435789)]),
        ));
  }

  Widget _buildListTile(TextTheme textTheme, ColorScheme colorScheme,
      String titleOne, String titleTwo, VoidCallback onTap) {
    return Row(
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
    );
  }
}
