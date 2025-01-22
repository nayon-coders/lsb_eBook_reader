import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/book_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/model/get_my_order_model.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_shimmer_pro.dart';

class MyOrderScreen extends GetView<MyOrderController> {
   MyOrderScreen({super.key});

  final BookController bookController = Get.find<BookController>();


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getMyOrder();
    });
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
       //automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        title:const Text("My Books",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() {
          if(controller.isGetting.value){
            return ListView.builder(
              itemCount: 10,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: AppShimmerPro.circularShimmer(width: double.infinity, height: 80, borderRadius: 10,),
              );
            });
          }
          if (controller.getOrderModel.value.ordersData!.isEmpty) {
            return const Center(
              child: EmptyScreen()
            );
          }else{

            return ListView.builder(
                itemCount: controller.getOrderModel.value.ordersData!.length,
                itemBuilder: (context,index){
                  final data = controller.getOrderModel.value.ordersData![index];
                  print("Order status: ${data.orderStatus}");
                  return Container(
                    margin:const EdgeInsets.only(bottom: 10),
                    padding:const EdgeInsets.only(right: 10),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //image
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.cardAmber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:data.image!,
                                height: 40,
                                width: 20,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),  // Loading indicator
                                errorWidget: (context, url, error) => Icon(Icons.error),     // Error indicator
                              ),
                              //child: Image.asset(Assets.book1,height:40,width:20,fit: BoxFit.cover,),
                            ),
                            const SizedBox(width: 10,),
                            //name rating
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  //book name
                                  SizedBox(
                                    width: 150,
                                    child: Text(data.bookName!,
                                      overflow: TextOverflow.ellipsis,
                                      style:const TextStyle(
                                          overflow:TextOverflow.ellipsis,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textBlack),
                                    ),
                                  ),

                                  //rating
                                  Row(
                                    children: [
                                      Icon(Icons.star_half, color: Colors.amber,size: 13,),
                                      Text("(${data.averageRating!.toStringAsFixed(2)})",style:const TextStyle(fontSize: 13,color: AppColors.textBlack),),
                                    ],
                                  ),

                                  //Price
                                  Text("${data.price} TK",style:const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: 80,
                          child: InkWell(
                            onTap: (){
                              if(data.orderStatus == "pending" || data.orderStatus == "cancel"){
                                return null;
                              }else{
                                bookController.bookId.value = data.bookId.toString();
                                Get.toNamed(AppRoute.mySingleBook);
                              }
                            },
                            child: data.orderStatus!.toLowerCase().contains("pending")
                                ? const Text("Payment Pending",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.red),)
                                : data.orderStatus!.toLowerCase().contains("cancel")
                                ? const Text("Cancel",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.red),)
                                : data.orderStatus.toString().toLowerCase().contains("complete") || data.orderStatus.toString().toLowerCase().contains("accept") || data.orderStatus.toString().toLowerCase().contains("successful")
                                ? const StatusButton(text: "Read",color: Colors.green)
                                : const StatusButton(text: "Pending",color: Colors.orange),
                          ),
                        ),




                      ],
                    ),
                  );

                });
          }



          }
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton({
    super.key,
    required this.text,
    this.color = AppColors.cardAmber,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child:  Text(text,
          style:const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
