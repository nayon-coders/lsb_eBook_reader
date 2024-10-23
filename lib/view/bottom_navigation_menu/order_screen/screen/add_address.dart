import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/controller/shipping_address_controller.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_button.dart';
import '../order_screen.dart';

class AddAddress extends GetView<ShippingAddressController> {
   AddAddress({super.key});

  final _key = GlobalKey<FormState>();
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
          child: Form(
            key: _key,
            child: ListView(
              children: [

                //phone number
                AppInput(
                    hint: "Phone",
                    controller:controller.phone.value,
                  textType: TextInputType.phone,

                ),


                const SizedBox(height: 15,),

                //city
                AppInput(
                    hint: "City",
                    textType: TextInputType.name,
                    controller:controller.city.value
                ),

                const SizedBox(height: 15,),
                AppInput(
                  hint: "District Name",
                  controller:controller.district.value,
                ),
                const SizedBox(height: 15,),


                AppInput(
                    hint: "Division Name",
                    controller:controller.division.value
                ),
                const SizedBox(height: 15,),

                AppInput(
                    hint: "Address",
                    controller:controller.address.value,
                  maxLine: 3,
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
              return AppButton(
                isLoading: controller.isLoading.value,
                width: double.infinity,
                name: "Save Address",
                onClick: (){
                  if(_key.currentState!.validate()){
                    controller.addShippingAddress();
                    Get.toNamed(AppRoute.orderScreen);
                  }

                },
              );
            }
          ),
        ),
      ),

    );
  }
}
