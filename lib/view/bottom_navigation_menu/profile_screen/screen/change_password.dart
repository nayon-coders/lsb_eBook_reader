import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
   ChangePassword({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title:const Text("Change Password",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:Colors.black),
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Old Password",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Obx(() {
                return AppInput(
                  hint: "Old Password",
                  controller: controller.oldPassword.value,
                  obscureText: controller.isOldPasswordShow.value,
                  suffixIcon: IconButton(
                    onPressed: (){
                      controller.isOldPasswordShow.value = !controller.isOldPasswordShow.value;
                    },
                    icon: Icon(controller.isOldPasswordShow.value ? Icons.visibility : Icons.visibility_off),
                  ),
                );
              }
            ),
            const SizedBox(height: 20,),
            Text("New Password",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Obx(() {
                return AppInput(
                    hint: "New Password",
                    controller: controller.newPassword.value,
                  obscureText: controller.isNewPasswordShow.value,
                  suffixIcon: IconButton(
                    onPressed: (){
                      controller.isNewPasswordShow.value = !controller.isNewPasswordShow.value;
                    },
                    icon: Icon(controller.isNewPasswordShow.value ? Icons.visibility : Icons.visibility_off),
                  ),
                );
              }
            ),
            const SizedBox(height: 20,),
            Text("Confirm Password",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Obx(() {
                return AppInput(
                    hint: "Confirm Password",
                    controller: controller.newPasswordConfirm.value,
                    obscureText: controller.isConfirmPasswordShow.value,
                    suffixIcon: IconButton(
                      onPressed: (){
                        controller.isConfirmPasswordShow.value = !controller.isConfirmPasswordShow.value;
                      },
                      icon: Icon(controller.isConfirmPasswordShow.value ? Icons.visibility : Icons.visibility_off),
                    ),
                );
              }
            ),
            const SizedBox(height: 40,),
            Center(child: Obx(() {
                return AppButton(
                    isLoading: controller.isLoading.value,
                    name: "Save",
                    onClick: (){
                      if(controller.newPassword.value.text.isEmpty){
                        Get.snackbar("Error", "Please enter new password", backgroundColor: Colors.red);
                      }else if(controller.newPasswordConfirm.value.text.isEmpty){
                        Get.snackbar("Error", "Please enter confirm password", backgroundColor: Colors.red);
                      }else if(controller.newPassword.value.text != controller.newPasswordConfirm.value.text) {
                        Get.snackbar("Error", "Password does not match",
                            backgroundColor: Colors.red);
                      }else{
                        controller.updateUserPassword(controller.myProfileModel.value.id.toString());
                      }
                    },
                );
              }
            ))
          ],
        ), 
      ),
    );
  }
}
