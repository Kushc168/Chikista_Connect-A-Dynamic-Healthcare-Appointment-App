 import 'package:dynamic_appointment/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../login/login_form_widget.dart';

class ForgetPasswordScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                fontFamily: 'Montserrat', // Suggested font: Montserrat
              ),
            ),
            Text(
                tForgetPasswordSubTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  fontFamily: 'Montserrat', // Suggested font: Montserrat
                )
            ),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: (){
                Navigator.pop(context);
                Get.to( ()=> const ForgetPasswordMailScreen());},
              btnIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetViaEMail,

            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}

 class ForgetPasswordBtnWidget extends StatelessWidget {
   const ForgetPasswordBtnWidget({
     required this.btnIcon,
     required this.subTitle,
     required this.title,
     required this.onTap,
     Key? key,
   }) : super(key: key);

   final IconData btnIcon;
   final String title,subTitle;
   final VoidCallback  onTap;

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: onTap,
       child: Container(
         padding: const EdgeInsets.all(20.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0),
             color: Colors.grey.shade200
         ),
         child: Row(
           children: [
             Icon(btnIcon, size:60.0),
             const SizedBox(width: 10.0),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(title, style: Theme.of(context).textTheme.titleLarge,),
                 Text(subTitle, style: Theme.of(context).textTheme.titleLarge,),
               ],
             )
           ],
         ),
       ),
     );
   }
 }
