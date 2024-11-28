import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/utility/app_const.dart';
import 'package:ebook_reader/view/order_screen/controller/create_order_controller.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/app_button.dart';


class PaymentScreen extends GetView<CreateOrderController> {
   PaymentScreen({super.key});

  BookInfo bookInfo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title:const Text("Payment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListTile(
                leading: Image.network(controller.selectedPaymentMethod.value.logoImage!, height: 60, width: 60,),
                title: Text(controller.selectedPaymentMethod.value.methodName!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                subtitle: Text("Pay with ${controller.selectedPaymentMethod.value.methodName!}"),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      PaymentBoxWiodget(
                        amount: "${controller.totalAmount.value.toStringAsFixed(2)} TK",
                        text: "Total order amount",
                      ),
                      const SizedBox(width: 20,),
                      PaymentBoxWiodget(
                        amount: "${controller.paymentCharge.value.toStringAsFixed(2)} TK",
                        text: "Charge",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      PaymentBoxWiodget(
                        amount: "${(controller.totalAmount.value + controller.paymentCharge.value).toStringAsFixed(2)} TK",
                        text: "Total pay amount",
                      ),

                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                AppConst.copyToClipboard(controller.selectedPaymentMethod.value.acocuntNumber.toString());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    const Text("Account Number: ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.textBlack,
                      ),
                    ),
                    Text("${controller.selectedPaymentMethod.value.acocuntNumber}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.copy, color: Colors.blue, size: 20,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Text("Confirm your payment",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 10,),
            AppInput(hint: "Payment Number", controller: controller.payNumber.value),
            const SizedBox(height: 15,),
            AppInput(hint: "Transaction ID", controller: controller.payTransId.value),
          ],
        )
      ),

      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(30.0),
        child: Obx((){
            return AppButton(
              isLoading: controller.isCreatingOrder.value,
              name: "Pay Now",
              onClick: () {
                if(controller.payNumber.value.text.isEmpty){
                  Get.snackbar("Error", "Please enter pay number", backgroundColor: Colors.red);
                  return;
                }
                if(controller.payTransId.value.text.isEmpty){
                  Get.snackbar("Error", "Please enter transaction id", backgroundColor: Colors.red);
                  return;
                }

                controller.placeOrder(bookInfo);

                // controller.createOrder();
              },
            );
          }
        ),
      ),

    );
  }
}

class PaymentBoxWiodget extends StatelessWidget {
  const PaymentBoxWiodget({
    super.key, required this.amount, required this.text,
  });

final String amount;
final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: AppColors.bottomNev)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                color: Colors.red
              ),
            )
          ],
        ),
      ),
    );
  }
}
