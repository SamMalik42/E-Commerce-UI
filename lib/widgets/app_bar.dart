import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool arrowBack;
  final  Function()? onPressed;

  CustomAppBar({required this.appBarTitle, this.arrowBack = false,this.onPressed})
      : preferredSize = Size.fromHeight(93.0);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
        child: SafeArea(
          child: Padding(
            child: Row(children: [
              ...[
                if (widget.arrowBack)
                  IconButton(
                      onPressed: widget.onPressed==null?() {
                        Navigator.pop(context);
                      }:widget.onPressed,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: colorScheme.background,
                        size: 20,
                      ))
              ],
              ...[
                if (widget.arrowBack == false)
                  SizedBox(
                    width: 13,
                  ),
              ],
              Text(
                widget.appBarTitle,
                style: textTheme.headline3!.copyWith(fontSize: 13.sp),
              ),
            ]),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        width: double.infinity,
        height: 12.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff233a72), Color(0xff435789)]),
        ));
  }
}
