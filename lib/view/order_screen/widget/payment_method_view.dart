import 'package:ebook_reader/view/order_screen/controller/payment_controller.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utility/app_color.dart';
import '../controller/create_order_controller.dart';

class PaymentMethodView extends GetView<PaymentController> {
   PaymentMethodView({super.key});

  final CreateOrderController orderController = Get.put(CreateOrderController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getPaymentInfo();
    });
    return Obx((){
      if(controller.isLoading.value){
        return ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index){
            return AppShimmerPro.circularShimmer(width: Get.width, height: 50, borderRadius: 5);
          },
        );
      }else if(controller.paymentModel.value.data!.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.paymentModel.value.data!.length, //controller.paymentList.length,
          itemBuilder: (context, index) {
            var data = controller.paymentModel.value.data![index];
            return  Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding:const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: (){
                  orderController.selectedPaymentMethod.value = data;
                  orderController.setPaymentCharge(); // set payment charge
                },
                contentPadding: EdgeInsets.zero,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Image.network(data.logoImage!,height: 40,width: 40,),
                title: Text("${data.methodName}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                trailing: Obx((){
                  return orderController.selectedPaymentMethod.value.id == data.id ? const Icon(Icons.check_circle,color: Colors.green,) : const SizedBox();
                }),

                subtitle:  Obx((){
                    return orderController.selectedPaymentMethod.value.id != data.id ? Text("Pay with ${data.methodName}") : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("${data.methodName} number: ",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textBlack),),
                            Text("${data.acocuntNumber}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.blue),),
                            const SizedBox(width: 5,),
                            const Icon(Icons.copy, color: Colors.blue, size: 15,)
                          ],
                        ),
                        const SizedBox(height: 7,),
                        Text("Account Type: ${data.accountType}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                        const SizedBox(height: 7,),
                        Text("Fee: ${data.charge}%",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.textBlack),),

                      ],
                    );
                  }
                ),

              ),
            );
          },
        );
      }else{
        return const Center(child: Text("No Payment Method Found"),);
      }


      }
    );
  }
}
