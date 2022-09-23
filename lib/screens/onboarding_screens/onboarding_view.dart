import 'dart:developer';

import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingBaseView extends StatefulWidget {
  @override
  State<OnBoardingBaseView> createState() => _OnBoardingBaseViewState();
}

class _OnBoardingBaseViewState extends State<OnBoardingBaseView> {
  late PageController pageController;

  List<String> onBoardingImagesPath = [
    AssetsPath.onBoardOne,
    AssetsPath.onBoardTwo,
    AssetsPath.onBoardThree
  ];

  List<String> titles = [
    "Fast Shipping",
    "Cash & Credit Back",
    "Big exhibition  for Handmade"
  ];

  List<String> subTitles = [
    "I provide essential stuff for your\nui designs every tuesday!",
    "I provide essential stuff for your\nui designs every tuesday!",
    "I provide essential stuff for your\nui designs every tuesday!",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController(initialPage: 0);
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: PageView(controller: pageController, children: [
        ...List.generate(
            onBoardingImagesPath.length,
            (index) => _onBoardingBody(context, textTheme, index, () {
                  if (index == 2) {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  }
                  pageController.animateToPage(index + 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }))
      ]),
    );
  }

  Stack _onBoardingBody(BuildContext context, TextTheme textTheme, int index,
      VoidCallback onTap) {
    var colorScheme = Theme.of(context).colorScheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                            onBoardingImagesPath[1],
                          )),
                          shape: BoxShape.circle,
                          color: Colors.white),
                    ),
                    ...[
                      if (index != 1)
                        Positioned(
                          top: index != 2 ? 70 : 110,
                          child: Container(
                            height: index != 2 ? 400 : 240,
                            child: Image.asset(
                              onBoardingImagesPath[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                    ]
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff233a72), Color(0xff435789)],
                  ),
                ),
                height: 53.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    titles[index],
                    textAlign: TextAlign.center,
                    style: textTheme.headline4!.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Opacity(
                    opacity: 0.60,
                    child: Text(
                      subTitles[index],
                      textAlign: TextAlign.center,
                      style: textTheme.labelMedium!.copyWith(fontSize: 11.sp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...[
                if (index != 2)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.60,
                          child: TextButton(
                            onPressed: () {
                                     Navigator.pushReplacementNamed(context, Routes.loginScreen);
                            },
                            child: Text(
                              "Skip",
                              style: textTheme.labelMedium!
                                  .copyWith(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Center(
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: index.toDouble(),
                            decorator: DotsDecorator(
                                color: colorScheme.secondary
                                    .withOpacity(0.2), // Inactive color
                                activeColor: colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: onTap,
                          child: Text(
                            "Next",
                            style: textTheme.labelMedium!
                                .copyWith(fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                  )
              ],
              ...[
                if (index == 2)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.60,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "",
                              style: textTheme.labelMedium!
                                  .copyWith(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Center(
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: index.toDouble(),
                            decorator: DotsDecorator(
                                color: colorScheme.secondary
                                    .withOpacity(0.2), // Inactive color
                                activeColor: colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: onTap,
                          child: Text(
                            "Start",
                            style: textTheme.labelMedium!
                                .copyWith(fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                  )
              ]
            ],
          ),
        )
      ],
    );
  }
}
