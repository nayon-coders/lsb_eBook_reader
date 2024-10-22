import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_button.dart';
import '../order_screen.dart';

class AddAddress extends StatelessWidget {
   AddAddress({super.key});

  final _name = TextEditingController();
  final _number = TextEditingController();
  final _division = TextEditingController();
  final _district = TextEditingController();
  final _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          leading:IconButton(
            onPressed: ()=>Get.to(()=>OrderScreen()),
            icon:const  Icon(Icons.close,color: Colors.black,),
          ),
          title:const Text("Add Address",
            style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 18,color: AppColors.textBlack),
          ),
          centerTitle: true,
          backgroundColor:AppColors.bgColor,
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [

              //name
              AppInput(
                  hint: "Name",
                  controller:_name
              ),
              const SizedBox(height: 15,),
              AppInput(
                  hint: "Contact Number",
                  textType: TextInputType.number,
                  controller:_number ),
              const SizedBox(height: 15,),


              AppInput(hint: "Division Name", controller:_division ),

              const SizedBox(height: 15,),
              AppInput(hint: "District Name", controller:_district ),

              const SizedBox(height: 15,),

              AppInput(hint: "Address", controller:_address ),



            ],
          ),
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            width: double.infinity,
            name: "Save Address",
            onClick: ()=>Get.to(()=>OrderScreen()),
          ),
        ),
      ),

    );
  }
}
