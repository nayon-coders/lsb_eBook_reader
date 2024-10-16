import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';
import '../../utility/app_assets.dart';
import '../../utility/app_color.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_input.dart';


class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _pass = TextEditingController();
  bool show = false;
  //slider


  @override
  Widget build(BuildContext context) {
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
              controller: _name),
          const SizedBox(height: 15,),


          AppInput(
              hint: "Email",
              textType: TextInputType.emailAddress,
              controller: _email),
          const SizedBox(height: 15,),

          AppInput(
              hint: "Phone",
              textType: TextInputType.number,
              controller: _phone),
          const SizedBox(height: 15,),

          AppInput(
            hint: "Password",
            textType: TextInputType.visiblePassword,
            controller: _pass,
            obscureText: show,
            suffixIcon: Icon(show?Icons.visibility_off:Icons.visibility,color: Colors.black,),
          ),





          const SizedBox(height: 30,),


          Center(child: AppButton(
            name: "Sign Up",
            onClick: ()=>Get.toNamed(RouteName.appNavigation),
          ),
          ),
          const SizedBox(height: 20,),

          Center(
            child: InkWell(
                onTap: ()=>Get.toNamed(RouteName.login),
                child:const Text("I have account. Login.",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.indigo),)),
          ),


        ],
      ),
    );
  }
}
