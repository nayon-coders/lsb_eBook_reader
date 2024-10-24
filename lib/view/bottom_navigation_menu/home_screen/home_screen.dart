import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook_reader/view/admission/admission.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/app_navigation_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/controller/menu_button_controller.dart';
import 'package:ebook_reader/view/my_books/my_books.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_color.dart';
import '../category_screen/screen/study_screen.dart';
import 'controller/controller.dart';
import 'widget/menu_card.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({super.key});


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
            onTap: (){},
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
      body: Padding(
        padding:const EdgeInsets.all(20),
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
                  return AppShimmerPro.circularShimmer(width: MediaQuery.of(context).size.width*.80, height: 150, borderRadius: 10,);
                }),
              );
            }else if(controller.getBannerModel.value.data != null && controller.getBannerModel.value.data!.isNotEmpty ){
              return SizedBox(
                height: 150,
                child: CarouselSlider(

                  options:CarouselOptions(

                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index,reason){
                        controller.updateIndex(index);
                      }
                  ) ,

                  items:controller.getBannerModel.value.data!.map((data){
                    return Builder(builder: (BuildContext context){
                      return Image.network(data.image.toString(),fit: BoxFit.cover,width: double.infinity,);
                    });
                  }).toList(),

                ),
              );
            }else{
              return const Center(child: EmptyScreen());
            }
          }),
          const SizedBox(height: 30,),

         const Text("Menus",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.textBlack),),
         const SizedBox(height: 10,),

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
