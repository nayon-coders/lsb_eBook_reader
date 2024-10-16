import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/home_screen/screen/capter_screen.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/bg_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_color.dart';

class SingleBookScreen extends StatelessWidget {
  const SingleBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(

        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: size.height*0.45,
                    width: size.width,
                    decoration:const BoxDecoration(
                      color: AppColors.cardAmber,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6)),
                    ),


                  ),

                  //Back Button
                  Positioned(
                    left: 10,
                    top: 10,
                    child: InkWell(
                      onTap: ()=>Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child:const Center(child:Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)),
                      ),
                    ),
                  ),

                  //Book Name
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text("Book Night",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                        Text("Book Night",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),

                      ],
                    ),
                  ),


                  //book image
                  Positioned(
                      top: 80,
                      bottom: 60,
                      left: 0,
                      right: 0,
                      child: Image.asset(Assets.book3,height: 200,width: 200,fit: BoxFit.contain,)),

                  Positioned(
                    bottom: -30,
                    left: 30,
                    right: 30,
                    child: Container(
                      padding:const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                      height: 70,
                      width: size.width*0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              blurRadius:4,
                              spreadRadius: 0.2,
                              color: Colors.grey

                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //rating
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFFFF1BF),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color: Colors.deepOrange,size: 20,),
                                Text("4.5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)
                              ],
                            ),

                          ),

                          //page number
                          Text("13 Page",
                            style: TextStyle(fontWeight: FontWeight.w600,
                                fontSize: 16,color: Colors.black),
                          ),

                          //language
                          Container(
                            alignment: Alignment.center,
                            padding:const EdgeInsets.all(5),
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFDEFDD6),
                            ),
                            child: Center(child: Text("Bangle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),

                          ),


                        ],
                      ),

                    ),
                  )


                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text("Book description",
                      style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.textBlack),
                    ),

                    const SizedBox(height: 20,),
                    Text("Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan "
                        "akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, "
                        "atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa "
                        "membantu kita mengatasi emosi negatif dan menghasilkan mental "
                        ".Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan"
                        " akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, "
                        "atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa"
                        " membantu kita mengatasi emosi negatif dan menghasilkan mental .",
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          color:AppColors.bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()=>Get.to(()=>ChapterScreen()),
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.buttonGreen),
                  ),
                  child: Center(child: Text("Read Sample",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color:AppColors.buttonGreen),)),
                ),
              ),
              AppButton(
                width: 140,
                  name: "Buy Now",
                  onClick: ()=>Get.toNamed(RouteName.orderScreen))
            ],
          ),
        ),
      ),
    );
  }
}
