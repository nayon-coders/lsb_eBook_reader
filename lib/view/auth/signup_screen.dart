import 'package:ebook_reader/view/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';
import '../../utility/app_assets.dart';
import '../../utility/app_color.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_input.dart';


class SignupScreen extends GetView<AuthController> {
   SignupScreen({super.key});
  //slider


  @override
  Widget build(BuildContext context) {
    //clear text field
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.clearAll();
    });
    return Scaffold(
      body: ListView(
        padding:const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 50,),
          Center(child: Image.asset(Assets.logo,height: 100,width: 100,fit: BoxFit.cover,)),
          const SizedBox(height: 20,),

          const Center(
            child:  Text("Signup",
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: AppColors.textBlack),
            ),
          ),


          const SizedBox(height: 20,),
          AppInput(
              hint: "Name",
              textType: TextInputType.name,
              controller: controller.name.value),
          const SizedBox(height: 15,),


          AppInput(
              hint: "Email",
              textType: TextInputType.emailAddress,
              controller: controller.email.value),
          const SizedBox(height: 15,),

          AppInput(
              hint: "Phone",
              textType: TextInputType.number,
              controller: controller.phone.value),
          const SizedBox(height: 15,),

          Obx((){
              return AppInput(
                hint: "Password",
                textType: TextInputType.visiblePassword,
                controller: controller.pass.value,
                obscureText: controller.show.value,
                suffixIcon: InkWell(
                    onTap: ()=>controller.show.value = !controller.show.value,
                    child: Icon(controller.show.value?Icons.visibility_off:Icons.visibility,color: Colors.black,)),
              );
            }
          ),





          const SizedBox(height: 30,),


          Center(child: Obx(() {
              return AppButton(
                name: "Sign Up",
                isLoading: controller.isRegister.value,
                onClick: ()=>controller.register(),
              );
            }
          ),
          ),
          const SizedBox(height: 20,),
          ///TODO: Google Signin button
          Container(
            height: 50,width: 250,
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
                  const Text("Sing up with Google",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color:AppColors.textBlack),
                  ),


                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),

          Center(
            child: InkWell(
                onTap: ()=>Get.toNamed(AppRoute.login),
                child:const Text("I have account. Login.",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.indigo),)),
          ),


        ],
      ),
    );
  }
}
