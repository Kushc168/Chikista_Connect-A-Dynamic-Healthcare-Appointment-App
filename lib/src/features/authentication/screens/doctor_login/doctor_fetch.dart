import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'doctor_tracking.dart';

class HlwDoctor extends StatefulWidget {
  const HlwDoctor({Key? key}) : super(key: key);

  @override
  State<HlwDoctor> createState() => _HlwDoctorState();
}

class _HlwDoctorState extends State<HlwDoctor> {
  bool _isSidebarOpen = false;
  late Stream<QuerySnapshot> _appointmentsStream;
  int _currentTokenIndex = 0;

  @override
  void initState() {
    super.initState();
    _appointmentsStream = FirebaseFirestore.instance
        .collection('appointments')
        .orderBy('date') // Order by date
        .snapshots(); // Listen to changes
  }

  // Function to toggle sidebar
  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  // Function to move to the next token
  void _nextToken() {
    setState(() {
      _currentTokenIndex++;
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
                      onTap: _toggleSidebar,
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
                  'My Appointments',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                // StreamBuilder to display appointments
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _appointmentsStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No appointments found'));
                      }
                      final int documentCount = snapshot.data!.docs.length;

                      return Scrollbar(
                        radius: Radius.circular(15),
                        thickness: 12,
                        thumbVisibility: true,
                        trackVisibility: true,
                        controller: ScrollController(),
                        child: ListView.builder(
                          itemCount: documentCount,
                          itemBuilder: (context, index) {
                            var appointment = snapshot.data!.docs[index];
                            var name = appointment['name'];
                            var age = appointment['age'];
                            var date = (appointment['date'] as Timestamp).toDate();
                            var time = appointment['time'];
                            var gender = appointment['gender'];
                            var symptom = appointment['symptoms'];
                            var phoneno = appointment['phone'];

                            return buildPatientCard(
                                name, age, date, time, gender, symptom, phoneno, index);
                          },
                        ),
                      );
                    },
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
        onPressed: _nextToken,
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
                onPressed: () => Get.to(() => DoctorAppointmentsScreen()),
                icon: Icon(Icons.event, color: Colors.white),
                tooltip: 'Appointment Tracking',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPatientCard(String name, int age, DateTime date, String time, String gender, String symptom, String phoneno, int token) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: token == _currentTokenIndex ? Colors.yellow : Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Token: $token', // Display the token number
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'name: $name',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'age: $age',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'date: ${DateFormat('yyyy-MM-dd').format(date)}', // Format the date
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'time: $time',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'gender: $gender',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'symptoms: $symptom',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'phone: $phoneno',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
