import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/reusable/colors.dart';
import 'package:travel_app/reusable/dimensions.dart';
import 'package:travel_app/reusable/text_style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Widget> textTabs = [
    Tab(text: 'Places'),
    Tab(text: 'Inspiration'),
    Tab(text: 'Emotions'),
  ];

  List<Widget> tabs = [
    Text('hi'),
    Text('asd'),
    // Text('wwww'),
  ];

  Map images = {
    'assets/images/balloning.png': 'Balloning',
    'assets/images/hiking.png': 'Hiking',
    'assets/images/kayaking.png': 'Kayaking',
    'assets/images/snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabBarController = TabController(length: textTabs.length, vsync: this);
    return Scaffold(
      //Hole BODY
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //APP BAR
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                  ),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                      Container(
                        height: Dimensions.height30 * 2,
                        width: Dimensions.width30 * 2,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(Dimensions.radius20)),
                      )
                    ],
                  ),
                ),

                //Text (Discover)
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    bottom: Dimensions.height20,
                  ),
                  child: BigText(text: 'Discover'),
                ),

                //TabBar
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabBarController,
                    labelPadding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.grey,
                    tabs: textTabs,
                    labelColor: Colors.black,
                    indicator:
                    CircleTabIndicator(radius: 3.5, color: AppColors.mainColor),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height30,
                  ),
                  child: TabBarView(
                    controller: _tabBarController,
                    children: [
                      Container(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: Dimensions.width20,
                            );
                          },
                          itemBuilder: (context, indexSlider) {
                            return GestureDetector(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[indexSlider]);
                              },
                              child: Container(
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+info[indexSlider].img),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                          },
                          padding: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Text('asd'),
                      Text('asd'),
                    ],
                  ),
                ),

                //Explore more
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: 'Explore more',
                        size: 22,
                      ),
                      SmallText(
                        text: 'See all',
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),

                //OPTIONS
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap:(){
                              },
                              child: Container(
                                margin:
                                EdgeInsets.symmetric(vertical: Dimensions.height15),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          images.keys.elementAt(index)
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                ),
                                width: Dimensions.height60 * 1.2,
                                height: Dimensions.height60 * 1.2,
                              ),
                            ),
                            SmallText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor1,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: Dimensions.width20 * 2,
                        );
                      },
                      itemCount: images.length,
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                )
              ],
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
