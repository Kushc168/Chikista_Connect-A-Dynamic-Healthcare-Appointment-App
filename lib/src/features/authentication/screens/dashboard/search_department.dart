import 'package:flutter/material.dart';

class SearchDepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search by Department'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Search by Department Screen'),
      ),
    );
  }
}
