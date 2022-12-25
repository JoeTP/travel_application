import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; ///
  static double screenWidth = Get.context!.width; ///

  //we need to get factor that is the result of dividing the screen dimensions by the container dimensions
  // factor = screen/container
  static double pageView = screenHeight / 2.64;
  static double foodContainer = screenHeight / 3.84;
  static double foodRateContainer = screenHeight / 8.03;

  //dynamic height padding and margin
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  static double height60 = screenHeight / 13.9;
  static double height90 = screenHeight / 9.2;
  static double height120 = screenHeight / 6.9;
  static double height150 = screenHeight / 5.5;
  static double height270 = screenHeight / 3;

  //dynamic width padding and margin
  static double width5 = screenHeight / 167;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;
  static double width90 = screenHeight / 9.2;
  static double width120 = screenHeight / 6.9;
  static double width150 = screenHeight / 5.5;

  //font
  static double font16 = screenHeight / 52.1;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.1;

  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize15 = screenHeight / 55.6;
  static double iconSize3 = screenHeight / 278.3;
}
