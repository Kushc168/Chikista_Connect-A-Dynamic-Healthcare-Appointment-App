import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'doctor.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _formKey = GlobalKey<FormState>();
  bool _appointmentBooked = false;

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Text editing controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _symptomsController.dispose();
    super.dispose();
  }

  // Method to add data to Firestore
  Future<void> _addAppointmentToFirestore() async {
    if (_selectedDate != null &&
        _selectedTime != null &&
        _selectedGender != null &&
        _formKey.currentState!.validate()) {
      try {
        await _firestore.collection('appointments').add({
          'name': _nameController.text,
          'age': int.parse(_ageController.text),
          'gender': _selectedGender!,
          'phone': _phoneController.text,
          'symptoms': _symptomsController.text,
          'date': _selectedDate!,
          'time': _selectedTime!.format(context), // Format TimeOfDay to string
        });
        setState(() {
          _appointmentBooked = true;
        });
      } catch (e) {
        print("Error adding appointment: $e");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to book appointment. Please try again later.'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill in all the details and select date and time.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Appointment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );

                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Date'),
              ),
              if (_selectedDate != null)
                Text('Selected Date: ${_selectedDate!.toString().split(' ')[0]}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final now = DateTime.now();
                  final timeOfDay = TimeOfDay(hour: now.hour, minute: 0); // Set minutes to 0

                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: timeOfDay,
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                        child: child!,
                      );
                    },
                    helpText: 'Select Time',
                  );

                  if (pickedTime != null && pickedTime != _selectedTime) {
                    // Check if the selected time is between 11 AM to 6 PM
                    if (pickedTime.hour >= 11 && pickedTime.hour < 18) {
                      setState(() {
                        // Set the selected time with minutes set to 0
                        _selectedTime = pickedTime;
                      });
                    } else {
                      // Show error message if selected time is outside the allowed range
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please select a time between 11 AM and 6 PM.'),
                      ));
                    }
                  }
                },
                child: Text('Select Time'),
              ),
              if (_selectedTime != null)
                Text('Selected Time: ${_selectedTime!.format(context)}'),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _symptomsController,
                decoration: InputDecoration(labelText: 'Symptoms'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your symptoms';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _addAppointmentToFirestore,
                child: Text('Submit'),
              ),
              SizedBox(height: 9),
              if (_appointmentBooked)
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Appointment booked successfully'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// import 'doctor.dart';
//
// class ScheduleScreen extends StatefulWidget {
//   @override
//   _ScheduleScreenState createState() => _ScheduleScreenState();
// }
//
// class _ScheduleScreenState extends State<ScheduleScreen> {
//   DateTime? _selectedDate;
//   TimeOfDay? _selectedTime;
//   final _formKey = GlobalKey<FormState>();
//   bool _appointmentBooked = false;
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(DateTime.now().year + 1),
//     );
//
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final now = DateTime.now();
//     final timeOfDay = TimeOfDay(hour: now.hour, minute: 0); // Set minutes to 0
//
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: timeOfDay,
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//           child: child!,
//         );
//       },
//       helpText: 'Select Time',
//     );
//
//     if (pickedTime != null && pickedTime != _selectedTime) {
//       // Check if the selected time is between 11 AM to 6 PM
//       if (pickedTime.hour >= 11 && pickedTime.hour < 18) {
//         setState(() {
//           // Set the selected time with minutes set to 0
//           _selectedTime = TimeOfDay(hour: pickedTime.hour, minute: 0);
//         });
//       } else {
//         // Show error message if selected time is outside the allowed range
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Please select a time between 11 AM and 6 PM.'),
//         ));
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule Appointment'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ElevatedButton(
//                 onPressed: () => _selectDate(context),
//                 child: Text('Select Date'),
//               ),
//               if (_selectedDate != null)
//                 Text('Selected Date: ${_selectedDate!.toString().split(' ')[0]}'),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => _selectTime(context),
//                 child: Text('Select Time'),
//               ),
//               if (_selectedTime != null)
//                 Text('Selected Time: ${_selectedTime!.format(context)}'),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your age';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 items: ['Male', 'Female', 'Other'].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (value) {},
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Symptoms'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your symptoms';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Navigate to MyDoctor page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyDoctor()),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//
//               SizedBox(height: 9),
//               if (_appointmentBooked)
//                 Row(
//                   children: [
//                     Icon(Icons.check, color: Colors.green),
//                     SizedBox(width: 8),
//                     Text('Appointment booked successfully'),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
