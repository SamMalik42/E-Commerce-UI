import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final String productName,
      productPrice,
      productImage,
      productSalePercent,
      productNewPrice;
  final bool haveRatings;

  final VoidCallback? onTap;
  ProductCard(
      {required this.productName,
      this.onTap,
      required this.productPrice,
      this.haveRatings = false,
      required this.productImage,
      required this.productNewPrice,
      required this.productSalePercent});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xffeaefff),
              width: 1,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 109,
                height: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(productImage, fit: BoxFit.fill),
              ),
              SizedBox(height: 8),
              Container(
                width: 100,
                child: Text(productName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: textTheme.headline2!.copyWith(
                      fontSize: 8.sp,
                      letterSpacing: 0.50,
                    )),
              ),
              SizedBox(height: 8),
              ...[
                if (haveRatings)
                  Row(
                    children: [
                      ...List.generate(
                        3,
                        (i) => Icon(
                          Icons.star_outlined,
                          size: 2.h,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        size: 2.h,
                        color: colorScheme.onPrimary,
                      ),
                    ],
                  )
              ],
              SizedBox(height: 8),
              Text(
                "299,43 le",
                style: textTheme.headline1!.copyWith(
                    fontSize: 8.sp,
                    letterSpacing: 0.50,
                    color: colorScheme.onSecondary),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "534,33 le",
                    style: textTheme.bodyText1!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: colorScheme.secondaryContainer,
                        fontSize: 7.sp,
                        letterSpacing: 0.50),
                  ),
                  SizedBox(width: 8),
                  Text("24% Off",
                      style: textTheme.headline1!.copyWith(
                        color: colorScheme.onPrimary,
                        fontSize: 7.sp,
                        letterSpacing: 0.50,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
