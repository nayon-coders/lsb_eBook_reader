import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../widgets/app_shimmer_pro.dart';

class MyOrderScreen extends GetView<MyOrderController> {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        title:const Text("My Order Books",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    width:double.infinity ,
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
                              width: 120,
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
                                  RatingBar(
                                    itemSize: 13,
                                    minRating: 1,
                                    maxRating: 5,
                                    initialRating: data.totalRatings!.toDouble(),
                                    allowHalfRating: true,
                                    ratingWidget: RatingWidget(
                                        full:const Icon(Icons.star,color: Colors.amber,size: 13,),
                                        half: const Icon(Icons.star_half, color: Colors.amber,size: 13,),
                                        empty:const Icon(Icons.star,color: Colors.grey,size: 13,)),
                                    onRatingUpdate: (v){},
                                    updateOnDrag: false,
                                  ),

                                  //Price
                                  Text("\$ ${data.price}",style:const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),

                        TextButton(onPressed: (){},
                          child: const Text("Read",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.linkColor),),)




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
