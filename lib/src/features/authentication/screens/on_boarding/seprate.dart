import 'package:flutter/material.dart';

class Seprate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Doctor Image
              Image.asset(
                'assets/doctor_image.jpg', // Provide the file path of the doctor image
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              // Login as Doctor Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Doctor Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorLoginPage()),
                  );
                },
                child: Text('Login as Doctor'),
              ),
              SizedBox(height: 20),
              // Login as User Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to User Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLoginPage()),
                  );
                },
                child: Text('Login as User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Login')),
      body: Center(
        child: Text('Doctor Login Page'),
      ),
    );
  }
}

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Login')),
      body: Center(
        child: Text('User Login Page'),
      ),
    );
  }
}
