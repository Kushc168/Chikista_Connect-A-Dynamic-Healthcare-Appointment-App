import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatelessWidget {
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
            child: AppointmentsListWidget(),
          ),
          SizedBox(width: 10),
          // Vertical live tracking in the middle
          Expanded(
            flex: 1,
            child: LiveTrackingWidget(),
          ),
          SizedBox(width: 10),
          // Time slots on the right
          Expanded(
            flex: 1,
            child: TimeSlotsWidget(),
          ),
        ],
      ),
    );
  }
}

class AppointmentsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i <= 8; i++) // Appointments from 1 to 8
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Appointment $i'),
            ),
          ),
      ],
    );
  }
}

class LiveTrackingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Progress value for appointments completion
    double progress = 5 / 8; // Assuming first 5 out of 8 appointments are completed

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border for visualization
      ),
      child: Column(
        children: [
          Expanded(
            flex: (5 * progress).round(), // Flex for completed appointments
            child: Container(
              color: Colors.green, // Color of completed portion
            ),
          ),
          Expanded(
            flex: (3 * (1 - progress)).round(), // Flex for remaining appointments
            child: Container(),
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
