import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../controller/shipping_address_controller.dart';
import 'addrass_card.dart';

class CustomBottomSheet extends GetxController {
  final ShippingAddressController addressController = Get.find<ShippingAddressController>();

  void openBottomSheet() {
    Get.bottomSheet(
      Obx(() {
        // Null check before using data
        if(addressController.isGetting.value){
          return Center(child: CircularProgressIndicator(),);
        }
        if (addressController.getAddressModel.value.data == null ||
            addressController.getAddressModel.value.data!.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 600,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: const Center(
              child: EmptyScreen(),
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.all(10),
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
                child: ListView.builder(
                  itemCount: addressController.getAddressModel.value.data!.length,
                  itemBuilder: (context, index) {
                    final data = addressController.getAddressModel.value.data![index];
                    return Column(
                      children: [
                        AddressCard(
                          home: data.city ?? "Unknown City",
                          bgColor: const Color(0xFFEEEEEE),
                          addressName: data.address ?? "No Address",
                          editIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.amber,)),
                          deleteIcon: IconButton(onPressed: (){
                            addressController.deleteShippingAddress(data.id.toString());
                          }, icon:const Icon(Icons.delete,color: Colors.red,)),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    );
                  },
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
