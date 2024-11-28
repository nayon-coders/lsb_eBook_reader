import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/book_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_shimmer_pro.dart';

class MyOrderScreen extends GetView<MyOrderController> {
   MyOrderScreen({super.key});

  final BookController bookController = Get.find<BookController>();


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getMyOrder();
    });
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
       //automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        title:const Text("My Order Books",
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
          }
            return ListView.builder(
                itemCount: controller.getOrderModel.value.ordersData!.length,
                itemBuilder: (context,index){
                  final data = controller.getOrderModel.value.ordersData![index];
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
                                errorWidget: (context, url, error) => const Icon(Icons.error),     // Error indicator
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
                                      const Icon(Icons.star_half, color: Colors.amber,size: 13,),
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
                          child: TextButton(onPressed: (){
                            if(data.orderStatus == "pending" || data.orderStatus == "cancel"){
                              return;
                            }else{
                              bookController.bookId.value = data.bookId.toString();
                              Get.toNamed(AppRoute.mySingleBook);
                            }
                          },
                            child:   Text(data.orderStatus == "pending" ? "Payment Verifying" : data.orderStatus == "cancel" ? "Canceled" : "Read",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.linkColor),),),
                        ),




                      ],
                    ),
                  );

                });


          }
        ),
      ),
    );
  }
}
