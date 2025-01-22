import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_button.dart';
import '../controller/create_order_controller.dart';
import '../controller/shipping_address_controller.dart';

class AddAddress extends GetView<ShippingAddressController> {
   AddAddress({super.key});

  final _key = GlobalKey<FormState>();
  final CreateOrderController orderController = Get.put(CreateOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading:IconButton(
          onPressed: (){
            controller.clearAll();
            Get.back();
          },
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

              //Name number
              AppInput(
                hint: "Name",
                controller:controller.name.value,
                textType: TextInputType.name,

              ),

              const SizedBox(height: 15,),
              //phone number
              AppInput(
                  hint: "Phone",
                  controller:controller.phone.value,
                textType: TextInputType.phone,

              ),


              const SizedBox(height: 15,),

              //Village
              AppInput(
                  hint: "Village",
                  textType: TextInputType.name,
                  controller:controller.village.value
              ),

              const SizedBox(height: 15,),

              //Union Name
              AppInput(
                hint: "Union Name",
                controller:controller.union.value,
              ),
              const SizedBox(height: 15,),


              //Upazila Name
              AppInput(
                  hint: "Upazila Name",
                  controller:controller.upazila.value
              ),
              const SizedBox(height: 15,),

              //Zila Name
              AppInput(
                  hint: "Zila Name",
                  controller:controller.zila.value
              ),
              const SizedBox(height: 15,),


              //Address
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
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
            return AppButton(
              isLoading: controller.isLoading.value,
              width: double.infinity,
              name: "Save Address",
              onClick: (){
                if(_key.currentState!.validate()){
                  if(controller.isEditing.value){
                    controller.editShippingAddress(controller.id.value);
                  }else{
                    controller.addShippingAddress();
                  }

                }

              },
            );
          }
        ),
      ),
    );
  }
}
