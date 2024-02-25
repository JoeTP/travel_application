import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/reusable/dimensions.dart';
import 'package:travel_app/reusable/responsive_button.dart';
import 'package:travel_app/reusable/text_style.dart';

import '../constant/const.dart';
import '../reusable/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {

    // var cubit = AppCubits();

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: ((context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage(images[index]),
              ),
            ),
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height90,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'text'),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    MediumText(text: 'text'),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      width: Dimensions.width120*2.3,
                      child: SmallText(size:14,text: LOREM,),
                    ),
                    SizedBox(
                      height: Dimensions.height20*2,
                    ),
                    GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: ResponsiveButton()),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 3),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    })
                  ,
                ),
              ],
            ),
          ),);
        }),
      ),
    );
  }
}
