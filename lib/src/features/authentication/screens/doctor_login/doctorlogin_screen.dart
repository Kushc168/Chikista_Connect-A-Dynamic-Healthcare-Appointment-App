import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import 'doctor_login_footer_widget.dart';
import 'doctor_login_form_widget.dart';
import 'doctor_login_header_widget.dart';

class DoctorLoginScreen extends StatelessWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorLoginHeaderWidget(),
                DoctorLoginForm(),
                DoctorLoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}