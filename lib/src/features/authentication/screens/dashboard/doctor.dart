import 'package:flutter/material.dart';
import 'package:dynamic_appointment/src/features/authentication/screens/dashboard/tracking.dart'; // Import your tracking screen

class MyDoctor extends StatefulWidget {
  const MyDoctor({Key? key}) : super(key: key);

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {
  bool _isSidebarOpen = false;
  int _currentAppointmentIndex = 0; // Track the current appointment index

  // Function to move to the next appointment
  void _moveToNextAppointment() {
    setState(() {
      _currentAppointmentIndex = (_currentAppointmentIndex + 1) % 8; // Increment index (modulo 8 to cycle through appointments)
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with sidebar toggle button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isSidebarOpen = !_isSidebarOpen;
                        });
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ID Name',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add logout functionality
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'My Appointments \n\n Waiting for updating to real-time ...',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                // Scrollable list of appointments with scrollbar
                Expanded(
                  child: Scrollbar(
                    showTrackOnHover: true,
                    child: ListView(
                      children: [
                        buildPatientCard('Aman', 18, 1),
                        buildPatientCard('Kush', 18, 2),
                        buildPatientCard('Aditya', 25, 3),
                        buildPatientCard('Tom', 50, 4),
                        buildPatientCard('Jerry', 35, 5),
                        buildPatientCard('Alice', 45, 6),
                        // Add more appointment cards here
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sidebar
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 0,
            left: _isSidebarOpen ? 0 : -250,
            bottom: 0,
            child: Container(
              width: 250,
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Appointments'),
                      onTap: () {
                        // Add navigation to Appointments page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Patients'),
                      onTap: () {
                        // Add navigation to Patients page
                      },
                    ),
                    // Add more sidebar items as needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveToNextAppointment, // Call the function to move to the next appointment
        child: Icon(Icons.arrow_forward),


      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70.0,
          color: Colors.blue[900], // Dark blue color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Navigate to home page
                },
                icon: Icon(Icons.home, color: Colors.white),
                tooltip: 'Home',
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAppointmentsScreen()),
                  );
                },
                icon: Icon(Icons.event, color: Colors.white),
                tooltip: 'Appointment Tracking',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPatientCard(String name, int age, int token) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Token: $token',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}