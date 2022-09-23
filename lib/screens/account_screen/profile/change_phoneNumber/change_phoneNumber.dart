import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePhoneNumber   extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Save',
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Number",
              style: textTheme.headline2!.copyWith(fontSize: 10.sp),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldLight(
              textInputType: TextInputType.number,
              isProfileScreen: true,
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                 Container(
                      child: Image.asset(AssetsPath.flag),
                      height: 32,
                      width: 34,
                    )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Enter Phone Number',
            ),
            
          ],
        ),
      )),
      appBar: CustomAppBar(
        appBarTitle: 'Phone Number',
        arrowBack: true,
      ),
      backgroundColor: colorScheme.background,
    );
  }
}
