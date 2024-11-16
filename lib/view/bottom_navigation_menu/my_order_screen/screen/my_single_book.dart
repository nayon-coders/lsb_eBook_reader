import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/favroit_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import '../../../../data/model/all_book_model.dart';
import '../../../../utility/app_color.dart';
import '../../category_screen/controller/book_controller.dart';
import '../../category_screen/widgets/single_book_loading_widget.dart';
import 'rating_view.dart';

class MySingleBookScreen extends GetView<BookController> {
  MySingleBookScreen({super.key});
  FavroitController favroitController =  Get.put(FavroitController());


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getBookById();
      favroitController.checkFavList(controller.bookId.value); //check favorite list
    });

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx((){
            if(controller.isLoading.value){
              return SingleBookLoadingWidget(size: size);
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: size.height*0.45,
                        width: size.width,
                        decoration:const BoxDecoration(
                          color: AppColors.bottomNev,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6)),
                        ),
                      ),
                      //Back Button
                      Positioned(
                        left: 10,
                        top: 10,
                        child: InkWell(
                          onTap: ()=>Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child:const Center(child:Icon(Icons.arrow_back,color: Colors.black,size: 20,)),
                          ),
                        ),
                      ),
                      //Book Name
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Text("${controller.singleBookModel.value.data!.bookName}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black),),
                            Text("${controller.singleBookModel.value.data!.categoryName}",style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.black),),
        
                          ],
                        ),
                      ),
        
                      //FAVORITE BUTTON
                      Positioned(
                        right: 10,
                        top: 10,
                        child: InkWell(
                          onTap: (){
                            if(favroitController.isFav.value){
                              //remove from favorite
                              favroitController.removeFavroit(controller.bookId.value); //add into favorite
                            }else {
                              favroitController.addFavroit(controller.bookId.value); //add into favorite
                            }
                          },
                          child: Obx(() {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child:Icon(
                                  favroitController.isFav.value ? Icons.favorite : Icons.favorite_border,
                                  color:  favroitController.isFav.value ? Colors.red : Colors.black,
                                  size: 20,
                                ),
                              ),
                            );
                          }
                          ),
                        ),
                      ),
        
        
                      //book image
        
                      Positioned(
                        top: 60,
                        bottom: 50,
                        left: 40,
                        right: 40,
                        child: CachedNetworkImage(
                          imageUrl:controller.singleBookModel.value.data!.image!,
                          height: 180,
                          width: 180,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const CircularProgressIndicator(),  // Loading indicator
                          errorWidget: (context, url, error) => const Icon(Icons.error),     // Error indicator
                        ),),
        
                      Positioned(
                        bottom: -30,
                        left: 30,
                        right: 30,
                        child: Container(
                          padding:const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                          height: 70,
                          width: size.width*0.70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:const [
                              BoxShadow(
                                  blurRadius:4,
                                  spreadRadius: 0.2,
                                  color: Colors.grey
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
        
                              //rating
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFFFFF1BF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star,color: Colors.deepOrange,size: 20,),
                                    Text("${controller.singleBookModel.value.data!.averageRating!.toStringAsFixed(2)}",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)
                                  ],
                                ),
        
                              ),
        
                              //page number
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
        
                                children: [
                                  Text( "${controller.singleBookModel.value.data!.mainToc} Chapter's",
                                    style:const TextStyle(fontWeight: FontWeight.w600,
                                        fontSize: 13,color: Colors.black),
                                  ),
                                  Text( "${controller.singleBookModel.value.data!.subToc} Topic's",
                                    style:const TextStyle(fontWeight: FontWeight.w600,
                                        fontSize: 13,color: Colors.black),
                                  ),
                                ],
                              ),
        
                              //language
                              Container(
                                alignment: Alignment.center,
                                padding:const EdgeInsets.all(5),
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:const Color(0xFFDEFDD6),
                                ),
                                child: Center(child: Text("Bangle",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),
        
                              ),
        
        
                            ],
                          ),
        
                        ),
                      )
        
        
                    ],
                  ),
        
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60,),
                        Text("Book description",
                          style:const TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.textBlack),
                        ),
        
                        const SizedBox(height: 20,),
                        Text("${controller.singleBookModel.value.data!.sortDescription}",
                            style: const TextStyle(fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.textBlack)
                        ),
                      ],
                    ),
                  )
        
                ],
              );
            }
        
          }
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding:const EdgeInsets.all(30),
        color:AppColors.bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              name: "Review",
              width: Get.width*.40,
              bgColor: AppColors.bottomNev,
              onClick: ()=>Get.bottomSheet(
                RatingView(id: controller.singleBookModel.value.data!.bookId!.toString(),),
                backgroundColor: Colors.white,
                elevation: 10,
              )),

            AppButton(
              name: "Read Book",
              width: Get.width*.40,
              onClick: ()=>Get.toNamed(AppRoute.chapter, arguments: {"data": controller.singleBookModel.value.data!, "allPermission" : true}),),


          ],
        ),
      ),
    );
  }
}

