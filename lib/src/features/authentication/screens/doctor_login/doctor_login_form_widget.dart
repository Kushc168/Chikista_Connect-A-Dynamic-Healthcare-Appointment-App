import 'package:flutter/material.dart';
import 'package:dynamic_appointment/src/features/authentication/screens/doctor_login/doctor_fetch.dart';
import 'package:dynamic_appointment/src/features/authentication/screens/doctor_login/doctor_tracking.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

const String tEmail = "E-Mail";
const String tPhoneNo = "Phone No";

class DoctorLoginForm extends StatelessWidget {
  const DoctorLoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Forget password button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(
                  'Forget Password',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HlwDoctor when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HlwDoctor()),
                  );
                },
                child: Text(
                  'Login'.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:dynamic_appointment/src/features/authentication/screens/doctor_login/doctor_fetch.dart';
// import 'package:dynamic_appointment/src/features/authentication/screens/doctor_login/doctor_tracking.dart';
// import 'package:flutter/material.dart';
//
//
// import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
//
// const String tEmail = "E-Mail";
// const String tPhoneNo = "Phone No";
//
// class DoctorLoginForm extends StatelessWidget {
//   const DoctorLoginForm({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.person_outline_outlined),
//                 labelText: 'Email', // Use string literal directly
//                 hintText: 'Email', // Use string literal directly
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20), // Adjust the height here
//             TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.fingerprint),
//                 labelText: 'Password',
//                 // Use string literal directly
//                 hintText: 'Password',
//                 // Use string literal directly
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   onPressed: null,
//                   icon: Icon(Icons.remove_red_eye_sharp),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20), // Adjust the height here
//
//             // Forget password button
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   ForgetPasswordScreen.buildShowModalBottomSheet(context);
//                 },
//                 child: const Text(
//                   'Forget Password', // Use string literal directly
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Navigate to HomeScreen when the button is pressed
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>  HlwDoctor()),
//                   );
//                 },
//                 child: Text(
//                   'Login'.toUpperCase(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
