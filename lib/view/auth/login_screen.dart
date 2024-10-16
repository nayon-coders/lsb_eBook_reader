import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/view/auth/forgot_password/enter_email.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class LoginScreen extends StatelessWidget {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool show = false;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        padding:const EdgeInsets.all(20) ,
        children: [
         const SizedBox(height: 50,),
           Center(child: Image.asset(Assets.logo,height: 100,width: 100,fit: BoxFit.cover,)),
         const SizedBox(height: 20,),

          const Center(
           child:  Text("Login",
             style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 30,
                 color: AppColors.textBlack),
           ),
         ),


         const SizedBox(height: 20,),
          AppInput(
              hint: "Email/phone number",
              textType: TextInputType.emailAddress,
              controller: _email,
          ),

         const SizedBox(height: 15,),


          AppInput(
            hint: "Password",
            controller: _pass,
            obscureText: show,
            suffixIcon: Icon(show?Icons.visibility_off:Icons.visibility,color: Colors.black,),
          ),


         const SizedBox(height: 10,),

          //forgot password
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: ()=>Get.to(()=>EnterEmail()),
                child:const Text("Forgot password?",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),
                ),
            ),
          ),

          const SizedBox(height: 30,),


          Center(child: AppButton(
              name: "Login",
              onClick: ()=>Get.toNamed(RouteName.appNavigation),
          ),
          ),
          const SizedBox(height: 20,),

          Center(
            child: InkWell(
                onTap: ()=>Get.toNamed(RouteName.signup),
                child:const Text("Don’t have any account? Signup.",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color:AppColors.textIdiko),
                ),
            ),
          ),
         const SizedBox(height: 20,),


        ],
      ),
    );
  }
}
