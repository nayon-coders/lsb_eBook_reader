import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/auth/forgot_password/new_password_screen.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({super.key});
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                //margin:const EdgeInsets.all(5),
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.buttonGreen,
                ),
                child:const Icon(Icons.arrow_back,color: Colors.white,size: 18,),
              ),
            ),
          ),
          const SizedBox(height: 100,),
          Center(
            child: Pinput(
              controller: _otpController,
              showCursor: true,
              length: 6,

            ),
          ),
         const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){},
                child: const Text("Resent",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.linkColor),)),
          ),
          const SizedBox(height: 30,),
          AppButton(name: "Continue", onClick: ()=>Get.to(()=>NewPasswordScreen()))
        ],
      ),

    );
  }
}
