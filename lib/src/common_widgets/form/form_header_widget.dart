import 'package:flutter/material.dart';

import '../../constants/image_strings.dart'; // Import material.dart to access Theme



const String tLoginTitle = "Unlock Your Health Journey!!"; // Define the login title
const String tLoginSubTitle = "Sign Up with Chikitsa Connect"; // Define the login subtitle

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight=0.2,
    this.textAlign,
    this.crossAxisAlignment=CrossAxisAlignment.start,
    }) : super(key: key);

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image,title,subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tWelcomeScreenImage),
          height: size.height * 0.3,
        ),
        Text(
          tLoginTitle, // Use the defined constant for login title
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24, // Adjust the font size as needed
          ),
        ),

        Text(
          tLoginSubTitle, // Use the defined constant for login subtitle
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    fontWeight: FontWeight.bold,
          )
        ),
      ],
    );
  }
}
