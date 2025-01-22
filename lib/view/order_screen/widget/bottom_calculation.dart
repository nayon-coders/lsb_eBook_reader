import 'package:ebook_reader/data/model/coupon_model.dart';
import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/coupon_controller.dart';
import 'package:ebook_reader/view/order_screen/controller/create_order_controller.dart';
import 'package:ebook_reader/view/order_screen/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_button.dart';
import 'order_rice_text.dart';


class BottomCalculationView extends GetView<CreateOrderController> {
   BottomCalculationView({
    super.key,
    required this.size,
    required this.bookInfo,
    required this.coupon,
  });

  final Size size;
  final BookInfo? bookInfo;
  final SingleCoupon coupon;
  final CouponController couponController =  Get.find<CouponController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //  controller.discountAmount.value = double.parse("${coupon.discountPrice}");
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

               OrderRiceText(name: "Sub Total", price: controller.subtotal.value!.toStringAsFixed(2)),
               const SizedBox(height: 6,),
               OrderRiceText(name: "Delivery Fee", price: "(+) ${controller.deliveryCharge.value.toStringAsFixed(2)}"),
              const SizedBox(height: 6,),
               OrderRiceText(name: "Discount", price: "(-) ${controller.discountAmount.value.toStringAsFixed(2)}"),
              const SizedBox(height: 6,),
               OrderRiceText(name: "Total", price: controller.totalAmount.value!.toStringAsFixed(2)) ,
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

                //order now


                // // Check if the address is selected
                // if (controller.selectedShippingAddress.value == null ||
                //     controller.selectedShippingAddress.value.city == null) {
                //   Get.snackbar("Error", "Please select a shipping address",
                //       backgroundColor: Colors.red);
                //   return; // or return null if the return type allows it
                // }



                Get.to(PaymentScreen(), arguments: bookInfo);



              })


            ],
          ),
        );
      }
    );
  }
}