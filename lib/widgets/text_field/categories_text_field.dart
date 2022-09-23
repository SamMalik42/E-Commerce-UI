import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldLight extends StatelessWidget {
  final TextEditingController controller;
  final bool isObsecure;
  final String hintText;
  final double height;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType textInputType;
   final  int horizontalContentPadding;
final bool isProfileScreen;
  const TextFieldLight(
      {Key? key,
      required this.controller,
      this.isObsecure = false,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.height=50,
      this.horizontalContentPadding=2,
      this.isProfileScreen=false,
      
      this.textInputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final inputBorder = OutlineInputBorder(
      borderSide:
          Divider.createBorderSide(context, color: Colors.white, width: 1.5),
    );

    return Container(
      height: height.toDouble(), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffeaefff),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: TextField(
        cursorColor: colorScheme.background,
        onChanged: (value) {},
        style: isProfileScreen==false? textTheme.bodyText2!.copyWith(
              fontSize: 10.sp,
              letterSpacing: 0.50,
              color: colorScheme.secondaryContainer):textTheme.headline2!.copyWith(fontSize: 9.sp,color: colorScheme.secondaryContainer),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding.toDouble(), vertical: 0),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: isProfileScreen==false? textTheme.bodyText2!.copyWith(
              fontSize: 9.sp,
              letterSpacing: 0.50,
              color: colorScheme.secondaryContainer):textTheme.headline2!.copyWith(fontSize: 9.sp,color: colorScheme.secondaryContainer),
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: false,
        ),
        keyboardType: textInputType,
        obscureText: isObsecure,
      ),
    );
  }
}
