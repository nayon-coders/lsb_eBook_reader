import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/bg_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});
   final _newPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Enter your new password",
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 30,),

            AppInput(hint: "New Password", controller: _newPass),

           const SizedBox(height: 30,),
            Center(child: AppButton(name: "Save", onClick: ()=>Get.toNamed(RouteName.login)))

          ],
        ),
      ),
    );
  }
}
