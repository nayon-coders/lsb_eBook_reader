import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/controller/favorite_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../utility/app_assets.dart';
import '../../../app_config.dart';
import '../../../widgets/app_shimmer_pro.dart';

class FavoriteScreen extends GetView<FavoriteBookController> {
   const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        // leading: IconButton(
        //     onPressed: ()=>Get.back(),
        //     icon:const Icon(Icons.arrow_back_ios,color: AppColors.textBlack,)),
        backgroundColor: AppColors.bgColor,
        title:const Text("Favorite Books",
          style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Most trading book",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
            SizedBox(
              height: 225,
              child: Obx(() {
                if(controller.isLoading.value){
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:4,
                      itemBuilder: (context,index){
                        return AppShimmerPro.circularShimmer(width: MediaQuery.of(context).size.width*.45, height: 180, borderRadius: 10,);

                      });
                }else{
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.getAllBookModel.value.data!.length,
                      itemBuilder: (context,index){
                        final data = controller.getAllBookModel.value.data![index];
                        return GestureDetector(
                          onTap: (){},
                          child: Container(
                            margin:const EdgeInsets.all(10),
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:const EdgeInsets.only(top: 20),
                                  alignment: Alignment.center,
                                  height: 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:index.isEven? AppColors.cardAmber:AppColors.cardBlue,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppConfig.DOMAIN}/${data.image}",
                                    //imageUrl:data.image.toString(),
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const CircularProgressIndicator(),  // Loading indicator
                                    errorWidget: (context, url, error) => Icon(Icons.error),     // Error indicator
                                  ),
                                  //child: Image.asset(index.isEven?Assets.book1:Assets.book2,height:120,width: 120,fit: BoxFit.cover,),
                                ),

                                const SizedBox(height: 6,),

                                //book Name
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(data.bookName.toString(),
                                    style:const TextStyle(fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.textBlack),
                                  ),
                                ),

                                //Rating
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: RatingBar(
                                    itemSize: 13,
                                    minRating: 1,
                                    maxRating: 5,
                                    initialRating: 3.0,
                                    allowHalfRating: true,
                                    ratingWidget: RatingWidget(
                                        full:const Icon(Icons.star,color: Colors.amber,size: 13,),
                                        half: const Icon(Icons.star_half, color: Colors.amber,size: 13,),
                                        empty:const Icon(Icons.star,color: Colors.grey,size: 13,)),
                                    onRatingUpdate: (v){},
                                    updateOnDrag: true,
                                  ),
                                ),
                                const  SizedBox(height: 5,),

                                //price
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text("\$${data.price.toString()}",style:const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        );

                      });
                }

                }
              ),
            ),

            const SizedBox(height: 20,),
            const Text("My Favourite",
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context,index){
                    return Container(
                      margin:const EdgeInsets.only(bottom: 15),
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
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: AppColors.cardAmber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(Assets.book1,height:40,width:20,fit: BoxFit.cover,),
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
                                    Text("Book Night",style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textBlack),
                                    ),

                                    //rating
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: RatingBar(
                                        itemSize: 13,
                                        minRating: 1,
                                        maxRating: 5,
                                        initialRating: 3,
                                        allowHalfRating: true,
                                        ratingWidget: RatingWidget(
                                            full:const Icon(Icons.star,color: Colors.amber,size: 13,),
                                            half: const Icon(Icons.star_half, color: Colors.amber,size: 13,),
                                            empty:const Icon(Icons.star,color: Colors.grey,size: 13,)),
                                        onRatingUpdate: (v){},
                                        updateOnDrag: true,
                                      ),
                                    ),

                                    //Price
                                    Text("\$ 90.45",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textBlack),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                          IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.red,))




                        ],
                      ),
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
