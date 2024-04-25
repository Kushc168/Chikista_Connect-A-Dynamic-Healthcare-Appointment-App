import 'package:flutter/material.dart';
import '../../../../utils/theme/widget_themes/card_with_button.dart';
import '../../../../utils/theme/widget_themes/option_widget.dart';
import '../welcome/welcome_screen.dart';
import 'book_appointment.dart';
import 'search_department.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chikitsa  Connect'),
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
                    onTap: () {
                      // Handle My Profile option
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    onTap: () {
                      // Navigate to the WelcomeScreen when Log Out is tapped
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
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
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
            CardWithButton(
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
            SizedBox(height: 8),
            CardWithButton(
              color: Colors.blue,
              image: AssetImage('assets/images/dashboard/output.png'),
              buttonText: 'Search by Department ',
              onPressed: () {
                // Code to handle searching by symptoms
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchDepartmentScreen()),
                );
              },
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
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image.asset(
                          'assets/images/dashboard/output.png',
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
                          SizedBox(height: 8),
                          Text(
                            'Specialty: Cardiologist',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              'Show Details',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
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
