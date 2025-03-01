
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());



  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => AnimatedPositioned(
              duration: const Duration(milliseconds:0),
              top: splashController.animate.value ? 0 : 80,
              left: splashController.animate.value ? 0 : 50,
              right: splashController.animate.value ? 0 : 30,
              bottom: splashController.animate.value ? 0 : 30,
              child: Image(
                image: AssetImage(tSplashImage), // Corrected asset path
              ),
            ),
          ),
          Obx(() =>AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashController.animate.value ? tDefaultSize : -20,
              right: splashController.animate.value ? tDefaultSize : 20,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,//it will display if 1 generate it is true and 0 generate false

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(tAppName,style: Theme.of(context).textTheme.headlineLarge,),
                    Text(tAppTagLine,style: Theme.of(context).textTheme.headlineMedium,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }

