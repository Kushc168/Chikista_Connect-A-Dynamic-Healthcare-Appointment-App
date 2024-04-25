import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Center(
        child: Text(
          'Messages Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
