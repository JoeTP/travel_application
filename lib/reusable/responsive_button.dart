
import 'package:flutter/material.dart';
import 'package:travel_app/reusable/colors.dart';
import 'package:travel_app/reusable/dimensions.dart';

class ResponsiveButton extends StatelessWidget {

  bool isResponsive;
  double? width;

  ResponsiveButton({Key? key,this.isResponsive = false, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: Dimensions.height30*2,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius20/2),
            child: Image.asset('assets/images/button-one.png',
            ),
          )
        ],
      ),
    );
  }
}
