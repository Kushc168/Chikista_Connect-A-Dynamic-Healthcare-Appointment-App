import 'package:flutter/material.dart';
import 'schedule.dart'; // Import the ScheduleScreen file

class BookAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Colors.blue, // Set app bar background color to blue
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Add some space from the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor', // Placeholder text
                hintStyle: TextStyle(color: Colors.black), // Hint text color
                filled: true,
                fillColor: Colors.green[100], // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none, // Hide border
                ),
              ),
            ),
          ),
          SizedBox(
              height: 20), // Add some space between search bar and doctor cards
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of doctor cards
              itemBuilder: (context, index) {
                return DoctorCard(
                  doctorName: _getDoctorName(index), // Example doctor name
                  specialization: _getSpecialization(index), // Example specialisation
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDoctorName(int index) {
    switch (index) {
      case 0:
        return 'Dr. Ananya Singh';
      case 1:
        return 'Dr. Rajesh Patel';
      case 2:
        return 'Dr. Nidhi Sharma';
      case 3:
        return 'Dr. Vikram Singh';
      case 4:
        return 'Dr. Priya Gupta';
      default:
        return 'Dr. Unknown';
    }
  }

  String _getSpecialization(int index) {
    switch (index) {
      case 0:
        return 'Cardiologist';
      case 1:
        return 'Orthopedic Surgeon';
      case 2:
        return 'Pediatrician';
      case 3:
        return 'Dermatologist';
      case 4:
        return 'Gynecologist';
      default:
        return 'Specialization Unknown';
    }
  }
}

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialization;

  DoctorCard({
    required this.doctorName,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
      child: GestureDetector(
        // Wrap DoctorCard with GestureDetector
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ScheduleScreen()), // Navigate to ScheduleScreen
          );
        },
        child: Container(
          color: Colors.blue[50], // Set background color for the card
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.symmetric(horizontal: 16.0),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle,
                color: Colors.blue,
                size: 40,
              ),
            ),
            title: Text(
              doctorName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            subtitle: Text(
              specialization,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan tincidunt nunc.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScheduleScreen()), // Navigate to ScheduleScreen
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Text(
                  'Book',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
