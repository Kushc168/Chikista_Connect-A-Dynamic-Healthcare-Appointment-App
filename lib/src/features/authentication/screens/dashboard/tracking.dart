import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatefulWidget {
  @override
  _MyAppointmentsScreenState createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  int _currentAppointmentIndex = 0; // Initialize with the first appointment

  void _nextAppointment() {
    setState(() {
      // Increment the appointment index
      _currentAppointmentIndex = (_currentAppointmentIndex + 1) % 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Row(
        children: [
          // Appointments on the left
          Expanded(
            flex: 2,
            child: AppointmentsListWidget(
              currentAppointmentIndex: _currentAppointmentIndex,
            ),
          ),
          SizedBox(width: 10),
          // Vertical live tracking in the middle
          Expanded(
            flex: 1,
            child: LiveTrackingWidget(
              currentAppointmentIndex: _currentAppointmentIndex,
            ),
          ),
          SizedBox(width: 10),
          // Time slots on the right
          Expanded(
            flex: 1,
            child: TimeSlotsWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextAppointment,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class AppointmentsListWidget extends StatelessWidget {
  final int currentAppointmentIndex;

  AppointmentsListWidget({required this.currentAppointmentIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8, // Assuming 8 appointments
      itemBuilder: (context, index) {
        return Card(
          color: index == currentAppointmentIndex
              ? Colors.green
              : Colors.white, // Change color if it's the current appointment
          child: ListTile(
            title: Text(
              'Appointment ${index + 1}',
              style: TextStyle(
                fontWeight: index == currentAppointmentIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Time: ${(10 + index).toString().padLeft(2, '0')}:00 AM',
              style: TextStyle(
                fontStyle: index == currentAppointmentIndex
                    ? FontStyle.italic
                    : FontStyle.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}

class LiveTrackingWidget extends StatelessWidget {
  final int currentAppointmentIndex;

  LiveTrackingWidget({required this.currentAppointmentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border for visualization
        borderRadius: BorderRadius.circular(10), // Add border radius for a rounded look
      ),
      child: Column(
        children: [
          for (int i = 0; i < 8; i++) // 8 appointments
            Expanded(
              child: Container(
                color: i == currentAppointmentIndex
                    ? Colors.black // Black color for the current appointment
                    : Colors.transparent,
                width: 10,
              ),
            ),
        ],
      ),
    );
  }
}

class TimeSlotsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 11; i <= 18; i++) // Time slots from 11:00 AM to 6:00 PM
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: Text('${i.toString().padLeft(2, '0')}:00'), // Display time slot
            ),
          ),
      ],
    );
  }
}