import 'package:flutter/material.dart'; // Import material.dart to access Theme

import '../../../../constants/image_strings.dart';

const String tLoginTitle = "Welcome Back,"; // Define the login title
const String tLoginSubTitle = "Here The Live Tracking begins with a click."; // Define the login subtitle

class DoctorLoginHeaderWidget extends StatelessWidget {
  const DoctorLoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tWelcomeScreenImage1),
          height: size.height * 0.4,
        ),
        Text(
          tLoginTitle, // Use the defined constant for login title
          style: TextStyle(
            fontWeight: FontWeight.bold, // Set font weight to bold
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
          ),
        ),
        Text(
          tLoginSubTitle, // Use the defined constant for login subtitle
          style: TextStyle(
            fontWeight: FontWeight.bold, // Set font weight to bold
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          ),
        ),
      ],
    );
  }
}
