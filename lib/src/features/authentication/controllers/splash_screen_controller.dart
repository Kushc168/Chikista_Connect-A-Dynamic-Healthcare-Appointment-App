import 'package:dynamic_appointment/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:get/get.dart';


import '../screens/welcome/welcome_screen.dart';
//import 'package:login_flutter_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();


  RxBool animate = false.obs;


  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(OnBoardingScreen()); // Navigate to the OnboardingScreen first
    await Future.delayed(
        const Duration(milliseconds: 10000)); // Delay for 10 seconds
    Get.to(WelcomeScreen()); // Navigate to the WelcomeScreen
  }
}