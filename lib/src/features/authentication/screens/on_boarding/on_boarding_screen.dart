import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constants/colors.dart';

import '../../controllers/on_boarding_controller.dart';


class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Retrieve screen size
    final OnBoardingController obcontroller = OnBoardingController(screenSize);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            onPageChangeCallback: obcontroller.onPageChangedCallback,
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obcontroller.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: tDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: TextButton(
              onPressed: () => obcontroller.skip(),
              child: const Text("skip", style: TextStyle(color: Colors.purple)),
            ),
          ),
          Obx(
                () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage.value,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
                count: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:dynamic_appointment/src/features/authentication/models/model_on_boarding.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../../../constants/colors.dart';
// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
// import '../../controllers/on_boarding_controller.dart';
// import 'on_boarding_page_widget.dart';
//
// class OnBoardingScreen extends StatelessWidget {
//    OnBoardingScreen({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final obcontroller=OnBoardingController();
//
//
//
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           LiquidSwipe(
//               pages: obcontroller.pages,
//               liquidController: obcontroller.controller,
//               slideIconWidget: Icon(Icons.arrow_back_ios),
//               onPageChangeCallback: obcontroller.onPageChangedCallback,
//               enableSideReveal: true,
//           ),
//           Positioned(
//             bottom: 60.0,
//             child: OutlinedButton(
//               onPressed: () => obcontroller.animateToNextSlide(),
//               style: ElevatedButton.styleFrom(
//                 side: const BorderSide(color: Colors.black26),
//                 shape: const CircleBorder(),
//                 padding: const EdgeInsets.all(20),
//                 foregroundColor: Colors.white,
//               ),
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: const BoxDecoration(
//                   color: tDarkColor,shape:BoxShape.circle
//                 ),
//                 child: Icon(Icons.arrow_forward_ios),
//               ),
//
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 30,
//             child: TextButton(
//               onPressed: () => obcontroller.skip(), // Assuming `controller` is an instance of PageController
//               child: const Text("skip", style: TextStyle(color: Colors.purple)),
//             ),
//           ),
//
//           Obx(
//             () => Positioned(
//               bottom: 10,
//                child: AnimatedSmoothIndicator(
//                 activeIndex:obcontroller.currentPage.value,
//                 effect: const WormEffect(
//                   activeDotColor: Color(0xff272727),
//                   dotHeight: 5.0,
//                 ),
//                 count: 3,
//                 ),
//             ),
//           ),
//         ],
//       ),
//
//
//     );
//   }
//
//
// }
