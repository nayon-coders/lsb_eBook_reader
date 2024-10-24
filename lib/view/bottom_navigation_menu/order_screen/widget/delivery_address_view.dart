import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/controller/create_order_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/controller/shipping_address_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../routes/route_name.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/empty_screen.dart';
import 'addrass_card.dart';
class ShippingAddressView extends GetView<ShippingAddressController> {
   ShippingAddressView({super.key});

  final CreateOrderController orderController = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getShippingAddress();
    });
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Shipping Address",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.textBlack,
              ),
            ),
            InkWell(
                onTap: ()=>openBottomSheet(),
                child: const Text("Change",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.linkColor),))

          ],
        ),


        const SizedBox(height: 10,),

        //address
        Obx(() {
          if(orderController.selectedShippingAddress.value == null){
            return Container();
          }else{
            var address = "${orderController.selectedShippingAddress.value!.address}, ${orderController.selectedShippingAddress.value!.city}, ${orderController.selectedShippingAddress.value!.district}, ${orderController.selectedShippingAddress.value!.division}";
            return Container(
              padding:const EdgeInsets.all(10),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected addres",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
                  SizedBox(
                      width: 300,
                      child: Text(
                        "${address}",
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.textBlack),)),
                ],
              ),
            );
          }

          }
        ),
      ],
    );
  }


  void openBottomSheet() {
    Get.bottomSheet(
      Obx(() {
        // Null check before using data
        if(controller.isGetting.value){
          return Center(child: CircularProgressIndicator(),);
        }
        if (controller.getAddressModel.value.data == null ||
            controller.getAddressModel.value.data!.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(30),
            height: 600,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                EmptyScreen(),
                Spacer(),
                AppButton(
                  width: double.infinity,
                  name: "Add new Address",
                  onClick: () {
                    Get.toNamed(AppRoute.addShippingAddress);
                  },
                ),
                SizedBox(height: 20,),
              ],
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.all(30),
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textBlack),
              ),
              const SizedBox(height: 10),
              // Expanded to ensure proper height for ListView.builder

              Expanded(
                child: Obx((){
                  return ListView.builder(
                    itemCount: controller.getAddressModel.value.data!.length,
                    itemBuilder: (context, index) {
                      final data = controller.getAddressModel.value.data![index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              orderController.selectedShippingAddress.value = data!;
                              Get.back();
                            },
                            child: AddressCard(
                              home: data.city ?? "Unknown City",
                              bgColor: const Color(0xFFEEEEEE),
                              addressName: data.address ?? "No Address",
                              editIcon: IconButton(onPressed: (){
                                controller.editValueSave(data);
                                Get.toNamed(AppRoute.addShippingAddress);
                              }, icon: const Icon(Icons.edit,color: Colors.amber,)),
                              deleteIcon: IconButton(onPressed: (){
                                controller.deleteShippingAddress(data.id.toString());
                              }, icon:const Icon(Icons.delete,color: Colors.red,)),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      );
                    },
                  );
                }
                ),
              ),
              const SizedBox(height: 10),
              AppButton(
                width: double.infinity,
                name: "Add new Address",
                onClick: () {
                  Get.toNamed(AppRoute.addShippingAddress);
                },
              ),
            ],
          ),
        );
      }),
    );
  }

}
