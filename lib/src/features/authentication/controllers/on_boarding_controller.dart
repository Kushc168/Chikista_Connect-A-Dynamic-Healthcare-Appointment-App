import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final LiquidController controller = LiquidController();
  RxInt currentPage = 0.obs;
  final Size size; // Define size as a property

  late final List<OnBoardingPageWidget> pages; // Define pages as a property

  OnBoardingController(this.size) {
    // Initialize pages inside the constructor where size is available
    pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingCounter1,
          height: size.height, // Access height from the size object
          bgColor: tOnBoardingPage1Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tOnBoardingTitle2,
          subTitle: tOnBoardingSubTitle2,
          counterText: tOnBoardingCounter2,
          height: size.height, // Access height from the size object
          bgColor: tOnBoardingPage2Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tOnBoardingTitle3,
          subTitle: tOnBoardingSubTitle3,
          counterText: tOnBoardingCounter3,
          height: size.height, // Access height from the size object
          bgColor: tOnBoardingPage3Color,
        ),
      ),
    ];
  }

  void onPageChangedCallback(int activePageIndex) => currentPage.value = activePageIndex;

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  skip() => controller.jumpToPage(page: 2);
}


// import 'dart:ffi';
//
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
//
// import '../../../constants/colors.dart';
// import '../../../constants/image_strings.dart';
// import '../../../constants/sizes.dart';
// import '../models/model_on_boarding.dart';
// import '../screens/on_boarding/on_boarding_page_widget.dart';
//
// class OnBoardingController extends GetxController{
//
//   final controller = LiquidController();
//   RxInt currentPage=0.obs;
//
//
//
//   final pages=[
//     OnBoardingPageWidget(
//       model:OnBoardingModel(
//         image: tOnBoardingImage1,
//         title: tOnBoardingTitle1,
//         subTitle: tOnBoardingSubTitle1,
//         counterText: tOnBoardingCounter1,
//         height: size.height,
//         bgColor: tOnBoardingPage1Color,
//       ),
//     ),
//
//     OnBoardingPageWidget(
//       model:OnBoardingModel(
//         image: tOnBoardingImage2,
//         title: tOnBoardingTitle2,
//         subTitle: tOnBoardingSubTitle2,
//         counterText: tOnBoardingCounter2,
//         height: size.height,
//         bgColor: tOnBoardingPage2Color,
//       ),
//     ),
//
//     OnBoardingPageWidget(
//       model:OnBoardingModel(
//         image: tOnBoardingImage3,
//         title: tOnBoardingTitle3,
//         subTitle: tOnBoardingSubTitle3,
//         counterText: tOnBoardingCounter3,
//         height: size.height,
//         bgColor: tOnBoardingPage3Color,
//       ),
//     ),
//   ];
//
//
//   void onPageChangedCallback(int activePageIndex) => currentPage.value= activePageIndex;
//   animateToNextSlide() {
//     int nextPage = controller.currentPage + 1;
//     controller.animateToPage(page: nextPage);
//   }
//   skip() => controller.jumpToPage(page: 2);
//
// }