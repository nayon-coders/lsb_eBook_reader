import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
           const  SizedBox(height: 50,),

           Image.asset(Assets.logo,height: 150,width: 150,fit: BoxFit.cover,),
           const SizedBox(height: 20,),


           const Text("Keep reading,",
             style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: AppColors.textBlack,
                 fontSize: 35),
           ),
           const SizedBox(height: 10,),


            const Text("You'll fall in love",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF585858),
                  fontSize: 16),
            ),

           const SizedBox(height: 20,),

            const SizedBox(
              width: 350,
              child:  Text("A library of bite-sized business eBooks on soft skills "
                  "and access to 30+ millions books in various "
                  "languages with an easy and simple monthly "
                  "subscription and read anywhere,any devices ",
                textAlign: TextAlign.center,
                style: TextStyle(

                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                    fontSize: 13),
              ),
            ),

            const SizedBox(height: 30,),

            //button
            AppButton(
                name: "Stay your journey",
                width: 200,
                onClick: ()=>Get.toNamed(RouteName.login)),

           const SizedBox(height: 20,),


            InkWell(
              onTap: (){},
              child: Container(
                height: 40,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF8FDA92),

                ),
                child:const  Center(child: Icon(Icons.arrow_forward_sharp,color: Colors.white,),),
              ),
            ),




          ],
        ),
      ),
    );
  }
}


