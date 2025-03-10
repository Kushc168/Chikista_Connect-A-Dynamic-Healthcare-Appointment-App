import 'package:dynamic_appointment/src/features/authentication/screens/dashboard/doctor.dart';
import 'package:dynamic_appointment/src/features/authentication/screens/login/login_screen.dart';
import 'package:dynamic_appointment/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../doctor_login/doctorlogin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.5),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold, // Set fontWeight to bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, // Set fontWeight to bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: ()  => Get.to(() => const DoctorLoginScreen()),
                    child: Text("Doctor's Login".toUpperCase()), // Button text
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:dynamic_appointment/src/features/authentication/screens/login/login_screen.dart';
// import 'package:dynamic_appointment/src/features/authentication/screens/signup/signup_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../constants/colors.dart';
// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_strings.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     var mediaQuery = MediaQuery.of(context);
//     var height = mediaQuery.size.height;
//     var brightness = mediaQuery.platformBrightness;
//     final isDarkMode = brightness == Brightness.dark;
//
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
//       body: Container(
//         padding: const EdgeInsets.all(tDefaultSize),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.5),
//             Column(
//               children: [
//                 Text(
//                   tWelcomeTitle,
//                   style: Theme.of(context).textTheme.displaySmall?.copyWith(
//                     fontWeight: FontWeight.bold, // Set fontWeight to bold
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   tWelcomeSubTitle,
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     fontWeight: FontWeight.bold, // Set fontWeight to bold
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () => Get.to(() => const LoginScreen()),
//                     child: Text(tLogin.toUpperCase()),
//                   ),
//                 ),
//                 const SizedBox(width: 10.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => Get.to(() => const SignUpScreen()),
//                     child: Text(tSignup.toUpperCase()),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }