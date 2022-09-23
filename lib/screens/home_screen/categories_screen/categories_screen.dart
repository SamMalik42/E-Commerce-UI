import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/constants/constants.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:iShoppin/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(children: [
        Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: textTheme.headline3!.copyWith(fontSize: 13.sp),
                      ),
                      Image.asset(
                        AssetsPath.cate,
                        height: 25,
                      )
                    ]),
              ),
            ),
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff233a72), Color(0xff435789)]),
            )),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFieldLight(
            prefixIcon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AssetsPath.searchIc,
                  color: colorScheme.primary,
                  height: 20,
                )
              ],
            ),
            controller: TextEditingController(),
            hintText: 'Search Category',
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Constants.categoriesIconPath.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListTile(
                          title: Text(
                            Constants.categoriesNames[i],
                            style: textTheme.headline1!.copyWith(
                                color: Color(0xff828282), fontSize: 9.sp),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorScheme.secondaryContainer,
                            size: 20,
                          ),
                          leading: Image.asset(
                            Constants.categoriesIconPath[i],
                            height: 22,
                          ),
                        ),
                      );
                    }),

                    
              ],
            ),
          ),
        )
      ]),
    );
  }
}
