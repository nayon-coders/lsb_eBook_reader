import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/widget/delivery_address_view.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/widget/payment_method_view.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/payment_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../data/model/single_book_model.dart';
import '../../../../utility/app_color.dart';
import '../controller/shipping_address_controller.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/order_rice_text.dart';

class OrderScreen extends GetView<ShippingAddressController> {
   OrderScreen({super.key});
  final _coupon = TextEditingController();

  //find controller
   final ShippingAddressController shippingAddressController = Get.find<ShippingAddressController>();
   final PaymentController paymentController = Get.find<PaymentController>();

   //argument store
   BookInfo? bookInfo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: ()=>Get.toNamed(AppRoute.appNavigation),
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
                        Text("৳ ${bookInfo!.price!.toStringAsFixed(2)}",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack),
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


            const SizedBox(height:20,),
            //Shopping address
            ShippingAddressView(),


            const SizedBox(height: 50,),
            AppInput(
                hint: "Coupon",
                controller:_coupon,
              suffixIcon: Container(
                margin:const EdgeInsets.all(6),
                padding:const EdgeInsets.all(4),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.buttonGreen,
                ),
                child:const Center(child: Text("Apply",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
           const OrderRiceText(name: "Sub Total", price: 20),
            const SizedBox(height: 6,),
           const OrderRiceText(name: "Delivery Fee", price: 10),
           const SizedBox(height: 6,),
            const OrderRiceText(name: "Discount", price: 10),
           const SizedBox(height: 6,),
            const OrderRiceText(name: "Total", price: 10),
            const SizedBox(height: 15,),
            AppButton(
              width: size.width,
                name: "Order Now", onClick: (){})


          ],
        ),
      ),
    );
  }
}
