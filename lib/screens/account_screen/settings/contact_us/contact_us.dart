import 'package:iShoppin/assets_path/assets_path.dart';
import 'package:iShoppin/services/routes/routes.dart';
import 'package:iShoppin/widgets/app_bar.dart';
import 'package:iShoppin/widgets/primary_elevatedBtn/primary_elevated_button.dart';
import 'package:iShoppin/widgets/text_field/categories_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFieldLight(
              prefixIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.message,
                    height: 20,
                  )
                ],
              ),
              controller: TextEditingController(),
              hintText: 'Your Email',
            ),
            SizedBox(
              height: 30,
            ),
            TextFieldLight(
              horizontalContentPadding: 15,
              height: 60.h,
              controller: TextEditingController(),
              hintText: 'Message',
            ),
          ],
        ),
      )),
      bottomNavigationBar: PrimaryElevatedBtn(
        buttonText: 'Send Message',
        onPressed: () {
          Navigator.pushNamed(context, Routes.contactUsTwo);
        },
      ),
      appBar: CustomAppBar(
        appBarTitle: 'Contact Us',
        arrowBack: true,
      ),
    );
  }
}
