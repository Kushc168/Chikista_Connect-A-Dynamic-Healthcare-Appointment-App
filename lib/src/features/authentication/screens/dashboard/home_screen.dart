import 'package:dynamic_appointment/src/features/authentication/screens/dashboard/tracking_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/theme/widget_themes/card_with_button.dart';
import '../../../../utils/theme/widget_themes/option_widget.dart';
import '../welcome/welcome_screen.dart';
import 'book_appointment.dart';
import 'search_department.dart';
// import 'home_appointments.dart';
import 'profile_screen.dart';
// import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chikitsa Connect'),
        backgroundColor: Color.fromARGB(255, 137, 188, 231),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.account_circle),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('My Profile'),
                    onTap: () => Get.to(() => ProfileScreen()),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    onTap: () => Get.to(() => WelcomeScreen()),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Token Info'),
              onTap: () {
                // Handle sidebar item 1 tap
              },
            ),
            ListTile(
              title: Text('Alerts'),
              onTap: () {
                // Handle sidebar item 2 tap
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                // Handle sidebar item 2 tap
              },
            ),
            ListTile(
              title: Text('More Info'),
              onTap: () {
                // Handle sidebar item 2 tap
              },
            ),
            // Add more ListTiles for additional sidebar items
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Hello, User',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Color.fromARGB(255, 147, 235, 99),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CardWithButton(
                color: Colors.blue,
                image: AssetImage('assets/images/dashboard/output.png'),
                buttonText: 'Book Appointment',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                  );
                  // Code to handle booking appointment
                },
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CardWithButton(
                color: Colors.blue,
                image: AssetImage('assets/images/dashboard/output.png'),
                buttonText: 'Search by Department',
                onPressed: () {
                  // Code to handle searching by department
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchDepartmentScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 4,
              color: Color.fromARGB(255, 147, 235, 99),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptionWidget(icon: Icons.healing, label: 'Medical'),
                    OptionWidget(icon: Icons.local_hospital, label: 'Hospital'),
                    OptionWidget(icon: Icons.medical_services, label: 'Doctor'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 4,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Added new button to navigate to HomeAppointmentsScreen
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeAppointmentsScreen()),
                        );
                      },
                      child: Text('Appointment Track'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
