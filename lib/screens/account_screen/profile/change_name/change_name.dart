import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: PrimaryElevatedBtn(buttonText: 'Save', onPressed: () {  },),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "First Name",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldLight(
              isProfileScreen: true,
              controller: TextEditingController(),
              hintText: 'Enter First Name',
            ),
             SizedBox(
              height: 25,
            ),
            Text(
              "Last Name",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldLight(
              isProfileScreen: true,
              controller: TextEditingController(),
              hintText: 'Enter Last Name',
            ),
          ],
        ),
      )),
      appBar: CustomAppBar(
        appBarTitle: 'Name',
        arrowBack: true,
      ),
      backgroundColor: colorScheme.background,
    );
  }
}
