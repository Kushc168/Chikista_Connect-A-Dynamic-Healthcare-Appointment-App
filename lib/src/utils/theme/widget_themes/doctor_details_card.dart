import 'package:flutter/material.dart';

class DoctorDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Increase padding
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20.0), // Add padding between image and text
                child: Image.asset(
                  'assets/output.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 8), // Add additional padding between text
                  Text(
                    'Specialty: Cardiologist',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                      height:
                          8), // Add additional padding between text and button
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Set button background color to green
                    ),
                    child: Text(
                      'Show Details',
                      style: TextStyle(
                          color:
                              Colors.black), // Set text color to black
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
