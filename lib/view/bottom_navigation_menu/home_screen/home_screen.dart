import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook_reader/view/admission/admission.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/app_navigation_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/book_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/controller/menu_button_controller.dart';
import 'package:ebook_reader/view/my_books/my_books.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_color.dart';
import '../category_screen/screen/study_screen.dart';
import 'controller/controller.dart';
import 'widget/menu_card.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({super.key});

   final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        leading:const Icon(Icons.menu_book,color: Colors.black45,size: 30,) ,
        title:const Text("Discover",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: AppColors.textBlack),) ,
        actions: [
          InkWell(
            onTap: ()=>Get.toNamed(AppRoute.allBooks),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow:const [
                    BoxShadow(
                        blurRadius: 0,
                        spreadRadius: .1,
                        blurStyle: BlurStyle.normal
                    )
                  ]
              ),
              child:const Center(child: Icon(Icons.search,color: Colors.black,),),
            ),
          ),
          const SizedBox(width: 10,),

        ],
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Carouse Slider
          Obx((){
            if(controller.isGetting.value){
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return AppShimmerPro.circularShimmer(width: Get.width, height: 200, borderRadius: 10,);
                }),
              );
            }else if(controller.getBannerModel.value.data != null && controller.getBannerModel.value.data!.isNotEmpty ){
              return SizedBox(
                height: 200,
                child: CarouselSlider(

                  options:CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index,reason){
                        controller.updateIndex(index);
                      }
                  ) ,

                  items:controller.getBannerModel.value.data!.map((data){
                    return Builder(builder: (BuildContext context){ 
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(data.image.toString(),fit: BoxFit.cover,width: double.infinity,));
                    });
                  }).toList(),

                ),
              );
            }else{
              return const Center(child: EmptyScreen());
            }
          }),
          const SizedBox(height: 30,),

         const Text("মেনু সমূহ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.textBlack),),
         const SizedBox(height: 15,),

          //Category Menu
          GridView.builder(
            itemCount: menuItems.length,
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
                mainAxisSpacing: 20,
               crossAxisSpacing: 20,
              ),
              itemBuilder: (context,index){
              final item = menuItems[index];
                return MenuCard(
                    name: item["name"],
                    image: item["image"],
                    onClick: ()=>homeMenuRouting(item["name"]),
                );
              }),


          SizedBox(height: 20,),
          const Text("জনপ্রিয় বই সমূহ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.textBlack),),
          //Category Menu
          SizedBox(height: 10,),
          Obx(() {
            if(bookController.mostTradingBook.value.isEmpty){
              return Center(child:  EmptyScreen(),);
            }else{
              return GridView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 180,
                  ),
                  itemCount: bookController.mostTradingBook.value.length,
                  itemBuilder: (context,index){
                    final data = bookController.mostTradingBook.value[index];
                    return InkWell(
                      onTap: (){
                        bookController.bookId.value = data.bookId.toString();
                        Get.toNamed(AppRoute.singleBook);
                      },
                      child: Container(
                      //  margin:const EdgeInsets.on(10),
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
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(10),
                                color:index.isEven? AppColors.cardAmber:AppColors.cardBlue,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: data.image!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),  // Loading indicator
                                errorWidget: (context, url, error) => const Icon(Icons.error),     // Error indicator
                              ),
                            ),

                            const SizedBox(height: 6,),

                            //book Name
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(data.bookName.toString(),
                                style:const TextStyle(fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: AppColors.textBlack),
                              ),
                            ),

                            //Rating
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 14,),
                                  Text("(${data.averageRating!.toStringAsFixed(1)})",style:const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack),
                                  ),
                                ],
                              ),
                            ),
                            const  SizedBox(height: 5,),

                            //price
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text("\$${data.price.toString()}",style:const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                              ),
                            )

                          ],
                        ),
                      ),
                    );

                  }
                  );


            }

          }
          ),
        ],
      ),
      ),
    );
  }

  //CardMenu List
  List<Map<String,dynamic>> menuItems=[
    {"name": "পড়াশোনা", "image": Assets.study, "screen": const StudyScreen()},
    {"name": "আমার বই", "image": Assets.mybook, "screen": const AppNavigationScreen()},
   // {"name": "আমার বই", "image": Assets.mybook, "screen": const MyBooks()},
    // {"name": "এডমিশন", "image": Assets.admission, "screen": const AdmissionScreen()},
    // {"name": "পড়াশোনা", "image": Assets.study, "screen": const StudyScreen()},
    // {"name": "আমার বই", "image": Assets.mybook, "screen": const MyBooks()},
    // {"name": "এডমিশন", "image": Assets.admission, "screen": const AdmissionScreen()},
  ];
}
