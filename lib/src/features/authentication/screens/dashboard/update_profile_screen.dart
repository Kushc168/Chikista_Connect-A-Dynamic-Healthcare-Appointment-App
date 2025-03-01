import 'package:dynamic_appointment/src/features/authentication/controllers/profile_controller.dart';
import 'package:dynamic_appointment/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

const String tEmail = "E-Mail";
const String tPhoneNo = "Phone No";
const String tFullName = "Full Name";
const String tPassword = "Password";

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      // Profile Image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey, // Placeholder color
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                tProfileImage,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: tPrimaryColor,
                                ),
                                child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: tDefaultSize), // Spacer

                      // Form Fields
                      Form(
                        child: Column(
                          children: [
                            // Full Name Field
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: InputDecoration(
                                labelText: tFullName,
                                prefixIcon: const Icon(LineAwesomeIcons.user),
                              ),
                            ),
                            const SizedBox(height: tFormHeight), // Spacer
                            // Email Field
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: tEmail,
                                prefixIcon: const Icon(LineAwesomeIcons.envelope_1),
                              ),
                            ),
                            const SizedBox(height: tFormHeight), // Spacer
                            // Phone Number Field
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: tPhoneNo,
                                prefixIcon: const Icon(LineAwesomeIcons.phone),
                              ),
                            ),
                            const SizedBox(height: tFormHeight), // Spacer
                            // Password Field
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: tPassword,
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  icon: const Icon(LineAwesomeIcons.eye_slash),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            const SizedBox(height: tFormHeight), // Spacer

                            // Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => const UpdateProfileScreen()),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  tEditProfile,
                                  style: TextStyle(color: tDarkColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: tFormHeight), // Spacer

                            // Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    alignment: Alignment.center,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(tDelete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
