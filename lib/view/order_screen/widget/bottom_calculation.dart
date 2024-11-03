import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/view/order_screen/controller/create_order_controller.dart';
import 'package:ebook_reader/view/order_screen/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_button.dart';
import 'order_rice_text.dart';


class BottomCalculationView extends GetView<CreateOrderController> {
  const BottomCalculationView({
    super.key,
    required this.size,
    required this.bookInfo,
  });

  final Size size;
  final BookInfo? bookInfo; 

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.calculateTotalAmount();
    });
    return Obx(() {
        return Container(
          padding:const EdgeInsets.all(20),
          height: 210,
          width: size.width,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               OrderRiceText(name: "Sub Total", price: controller.subtotal.value!),
               SizedBox(height: 6,),
               OrderRiceText(name: "Delivery Fee", price: controller.deliveryCharge.value),
              const SizedBox(height: 6,),
               OrderRiceText(name: "Discount", price: controller.discountAmount.value),
              const SizedBox(height: 6,),
               OrderRiceText(name: "Total", price: controller.totalAmount.value) ,
              const SizedBox(height: 15,),
              AppButton(
                  width: size.width,
                  name: "Order Now", onClick: (){

// Check if the payment method is selected
                if (controller.selectedPaymentMethod.value == null ||
                    controller.selectedPaymentMethod.value.methodName == null) {
                  Get.snackbar("Error", "Please select a payment method",
                      backgroundColor: Colors.red);
                  return; // or return null if the return type allows it
                }

                // Check if the address is selected
                if (controller.selectedShippingAddress.value == null ||
                    controller.selectedShippingAddress.value.city == null) {
                  Get.snackbar("Error", "Please select a shipping address",
                      backgroundColor: Colors.red);
                  return; // or return null if the return type allows it
                }



                Get.to(PaymentScreen(), arguments: bookInfo);



              })


            ],
          ),
        );
      }
    );
  }
}