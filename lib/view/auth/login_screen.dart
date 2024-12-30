import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/view/auth/controller/auth_controller.dart';
import 'package:ebook_reader/view/auth/forgot_password/enter_email.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';

class LoginScreen extends GetView<AuthController> {

  bool show = false;
  LoginScreen({super.key});




  @override
  Widget build(BuildContext context) {
    //widget binding
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.clearAll();
    });
    return  Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
               Center(child: Image.asset(Assets.logo,height: 100,width: 100,fit: BoxFit.cover,)),
             const SizedBox(height: 20,),

              const Center(
               child:  Text("Login",
                 style: TextStyle(fontWeight: FontWeight.bold,
                     fontSize: 30,
                     color: AppColors.textBlack),
               ),
             ),


             const SizedBox(height: 50,),
              AppInput(
                  hint: "Email",
                  textType: TextInputType.emailAddress,
                  controller: controller.email.value,
              ),

             const SizedBox(height: 15,),


              Obx(() {
                  return AppInput(
                    hint: "Password",
                    controller: controller.pass.value,
                    obscureText: controller.show.value,
                    suffixIcon: InkWell(
                        onTap: ()=>controller.show.value = !controller.show.value,
                        child: Icon(controller.show.value?Icons.visibility_off:Icons.visibility,color: Colors.black,)),
                  );
                }
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


              Center(child: Obx(() {
                  return AppButton(
                    isLoading: controller.isLogin.value, //isLogin value
                      name: "Login",
                      onClick: ()=>controller.login(), //login function
                  );
                }
              ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: InkWell(
                  //  onTap: ()=>Get.toNamed(AppRoute.home),
                    child:const Text("OR",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color:AppColors.textBlack),
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              ///TODO: Google Signin button
              Container(
                height: 50,width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300,width: 1)
                ),
                child: InkWell(
                   onTap: ()=>controller.signInWithGoogle(),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.google,height: 30,width: 30,fit: BoxFit.cover,),
                        const SizedBox(width: 10,),
                        const Text("Login with Google",
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color:AppColors.textBlack),
                        ),


                      ],
                    ),
                ),
              ),
              const SizedBox(height: 20,),

              Center(
                child: InkWell(
                    onTap: ()=>Get.toNamed(AppRoute.signup),
                    child:const Text("Don’t have any account? Signup.",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:AppColors.textIdiko),
                    ),
                ),
              ),
             const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}
