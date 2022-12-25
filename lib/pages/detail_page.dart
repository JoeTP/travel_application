import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/reusable/colors.dart';
import 'package:travel_app/reusable/dimensions.dart';
import 'package:travel_app/reusable/text_style.dart';

import '../cubit/app_cubits.dart';
import '../reusable/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int starRate = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height150 * 2.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/' +
                                    detail.place.img),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: Dimensions.height150 * 1.7,
                  bottom: 0,
                  child: Container(
                    height: Dimensions.height150 * 3,
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20 * 2),
                          topLeft: Radius.circular(Dimensions.radius20 * 2),
                        )),
                    padding: EdgeInsets.only(
                        left: Dimensions.width30,
                        right: Dimensions.width30,
                        top: Dimensions.height30 * 1.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //YOSEMITE $250
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            BigText(
                              text: '\$ ' + detail.place.price.toString(),
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10),
                        //Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.textColor1,
                              size: 20,
                            ),
                            SmallText(
                              text: ' ' + detail.place.location,
                              size: 15,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10),
                        //Stars
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < detail.place.stars
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: AppColors.starColor,
                                );
                              }),
                            ),
                            SmallText(
                              text: ' ' + detail.place.stars.toString(),
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: Dimensions.height20),
                        //People
                        BigText(
                          text: 'People',
                          size: 20,
                        ),
                        SizedBox(height: Dimensions.height10),
                        SmallText(text: 'Number of people in your group'),
                        SizedBox(height: Dimensions.height10 * 1.5),
                        //Number of groups
                        Container(
                          height: Dimensions.height20 * 2.7,
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: Dimensions.height20 * 2.7,
                                  width: Dimensions.height20 * 2.7,
                                  decoration: BoxDecoration(
                                    color: (selectedIndex == index)
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20 / 2),
                                  ),
                                  child: Center(
                                    child: BigText(
                                      text: (index + 1).toString(),
                                      size: 20,
                                      color: (selectedIndex == index)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                            
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: Dimensions.width10,
                              );
                            },
                            itemCount: 5,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        BigText(
                          text: 'Description',
                          size: 20,
                        ),
                        SizedBox(height: Dimensions.height10),
                        Expanded(
                          child: Container(
                            width: Dimensions.screenWidth,
                            child: SmallText(text: detail.place.description),
                          ),
                        ),
                        //Book and favorite
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Dimensions.height30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Dimensions.height60,
                                height: Dimensions.height60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.mainColor),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20 / 2)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: Dimensions.width150 * 1.7,
                                height: Dimensions.height60,
                                decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20 / 2)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.width15),
                                      child: Text(
                                        'Book Trip Now',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20 / 2),
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/button-one.png')))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
