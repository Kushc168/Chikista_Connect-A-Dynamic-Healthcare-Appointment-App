import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: 20), // Adjust the height here
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {},
            label: const Text("Sign In with Google"), // Use string literal directly
          ),
        ),
        const SizedBox(height: 20), // Adjust the height here
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: "Don't have an account? ", // Use string literal directly
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(text: "Sign Up", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
