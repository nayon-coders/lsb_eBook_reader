
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/coupon_controller.dart';
import 'package:ebook_reader/view/order_screen/controller/payment_controller.dart';
import 'package:ebook_reader/view/order_screen/controller/create_order_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../data/model/single_book_model.dart';
import '../../../../utility/app_color.dart';
import '../controller/shipping_address_controller.dart';
import '../widget/bottom_calculation.dart';
import '../widget/delivery_address_view.dart';
import '../widget/payment_method_view.dart';

class OrderScreen extends GetView<CreateOrderController> {
   OrderScreen({super.key});

  //find controller
   final ShippingAddressController shippingAddressController = Get.find<ShippingAddressController>();
   final PaymentController paymentController = Get.find<PaymentController>();
   final CouponController couponController = Get.find<CouponController>();

   //argument store
   BookInfo? bookInfo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.productPrice.value = double.parse("${bookInfo!.sellPrice!}");
    });
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: (){
            controller.clearAll();
            Get.back();
          },
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text("${bookInfo!.bookName} - Order",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),)
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //book details
            Container(
              height: 100,
              width:size.width ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.cardAmber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(bookInfo!.image!,fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //book name
                        Text("${bookInfo!.bookName}",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlack),
                        ),
                        SizedBox(height: 5,),

                        //rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.amber,size: 17,),
                            Text("(${bookInfo!.averageRating!.toStringAsFixed(2)})")
                          ],
                        ),
                        SizedBox(height: 5,),

                        //Price
                        Row(
                          children: [
                            Text("৳ ${bookInfo!.sellPrice ?? 0}",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack),
                            ),
                            SizedBox(width: 10,),
                            Text("৳ ${bookInfo!.price!.toStringAsFixed(2)}",style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )



                ],
              ),
            ),

          const SizedBox(height: 20,),

           const Text("Choose Payment get way",
              style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 18,color: AppColors.textBlack),
            ),
           const SizedBox(height: 10,),

            //payment method view
            PaymentMethodView(),


            //const SizedBox(height:20,),
            //Shopping address
            //ShippingAddressView(),

            const SizedBox(height: 20,),
            AppInput(
              hint: "Coupon",


              controller: couponController.coupon.value,
              suffixIcon: Obx((){
                return InkWell(
                  onTap: (){
                    if ( couponController.coupon.value.text.isNotEmpty) {
                      couponController.applyCoupon(bookInfo!.bookId!);
                      print("couponController.selectedCoupon.value -- ${couponController.selectedCoupon.value.code}");
                      if(couponController.selectedCoupon.value.discountPrice != null){
                        controller.discountAmount.value = double.parse("${couponController.selectedCoupon.value.discountPrice}");
                      }else{
                        controller.discountAmount.value = 0.0;
                      }
                      controller.calculateTotalAmount();
                    }
                  },
                  child: Container(
                    margin:const EdgeInsets.all(6),
                    padding:const EdgeInsets.all(4),
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.buttonGreen,
                    ),
                    child: Center(
                        child: couponController.isLoading.value ? CircularProgressIndicator(color: Colors.white,) : Text("Apply",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),
                  ),
                );
              }
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomCalculationView(size: size, bookInfo: bookInfo, coupon: couponController.selectedCoupon.value,),
    );
  }
}

