import 'package:ebook_reader/view/order_screen/screen/add_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/app_color.dart';
import '../../../widgets/app_button.dart';
import 'addrass_card.dart';

class CustomBottomSheet extends GetxController{

  void openBottomSheet(){
    Get.bottomSheet(
        Container(
          padding:const EdgeInsets.all(10),
          height: 600,
          width: double.infinity,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("Select Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
              const SizedBox(height: 10,),
              const AddressCard(
                  home: "Home",
                  bgColor: Color(0xFFEEEEEE),
                  addressName: "Motijheel, Mugda, Manda, Green Model town, Block c, Roade1,"),
              const SizedBox(height: 10,),
              const AddressCard(
                  home: "Home",
                  bgColor: Color(0xFFEEEEEE),
                  addressName: "Motijheel, Mugda, Manda, Green Model town, Block c, Roade1,"),
              const SizedBox(height: 10,),
              const AddressCard(
                  home: "Home",
                  bgColor: Color(0xFFEEEEEE),
                  addressName: "Motijheel, Mugda, Manda, Green Model town, Block c, Roade1,"),
              const Spacer(),
              AppButton(
                  width: double.infinity,
                  name: "Add new Address",
                  onClick: (){
                    Get.to(()=>AddAddress());
                  },
              )

            ],
          ),

        ));
  }


}