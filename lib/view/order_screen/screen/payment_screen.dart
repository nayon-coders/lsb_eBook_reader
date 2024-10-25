import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/order_screen/controller/create_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_button.dart';
import '../widget/payment_method_view.dart';

class PaymentScreen extends GetView<CreateOrderController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title:const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //payment method
             Center(child: Image.network("${controller.selectedPaymentMethod.value!.logoImage}", height: 100, width: 200,)),
            SizedBox(height: 20,),
            Center(child: Text("Pay with ${controller.selectedPaymentMethod.value!.methodName}",style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)),
            SizedBox(height: 10,),
            //payment method
            Center(child: Text("${controller.selectedPaymentMethod.value!.accountType} Account",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
            SizedBox(height: 5,),
            //account number
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${controller.selectedPaymentMethod.value!.acocuntNumber}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.blue),),
                IconButton(onPressed: (){}, icon:const Icon(Icons.copy, color: Colors.blue,))
              ],
            )),

            SizedBox(height: 20,),
            Center(
              child: Text("Total Pay",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.textBlack,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text("৳ ${controller.totalAmount.value}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: AppColors.textBlack,
                ),
              ),
            ),


            //button

          ],
        ),
      ),

      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(30.0),
        child: AppButton(
          name: "Pay Now",
          onClick: () {
            // controller.createOrder();
          },
        ),
      ),

    );
  }
}
