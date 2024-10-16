import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/auth/forgot_password/otp_screen.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/bg_theme.dart';
import 'package:ebook_reader/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterEmail extends StatelessWidget {
   EnterEmail({super.key});
  final _email = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _key,
        child: ListView(
          padding:const EdgeInsets.all(20),

          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
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
           const SizedBox(height: 20,),
         // Image.asset(Assets.logo,height: 70,width: 70,fit: BoxFit.cover,),

          const  Text("Forgot Password",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 20,),
           const Text("Enter your registered Email.We send password reset Email to reset your password",
             style: TextStyle(
                 fontWeight: FontWeight.w500,
                 fontSize: 15,
                 color:AppColors.textBlack,
             ),
           ),
            const SizedBox(height: 30,),

            AppInput(
              hint: "Email",
              controller: _email,
              textType: TextInputType.emailAddress,
            ),


            const SizedBox(height: 20,),


            Center(
              child: AppButton(
                  name: "Continue",
                  onClick: ()=>Get.to(()=>OtpScreen()),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
