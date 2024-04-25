import 'package:flutter/material.dart';

class CardWithButton extends StatelessWidget {
  final Color color;
  final ImageProvider image;
  final String buttonText;
  final VoidCallback onPressed;

  const CardWithButton({
    Key? key,
    required this.color,
    required this.image,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: 120,
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
