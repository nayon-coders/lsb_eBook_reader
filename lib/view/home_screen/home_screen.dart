import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook_reader/view/admission/admission.dart';
import 'package:ebook_reader/view/home_screen/controller/controller.dart';
import 'package:ebook_reader/view/home_screen/screen/study_screen.dart';
import 'package:ebook_reader/view/home_screen/widget/menu_card.dart';
import 'package:ebook_reader/view/my_books/my_books.dart';
import 'package:flutter/material.dart';
import '../../utility/app_assets.dart';
import '../../utility/app_color.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   final controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Carouse Slider
          Obx(()=>CarouselSlider(

            options:CarouselOptions(

                height: 150,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  controller.updateIndex(index);
                }
            ) ,
            items:controller.imageList.map((imageUrl){
              return Builder(builder: (BuildContext context){
                return Image.asset(imageUrl,fit: BoxFit.cover,width: double.infinity,);
              });
            }).toList(),

          )),
          const SizedBox(height: 30,),

         const Text("Menus",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.textBlack),),
         const SizedBox(height: 10,),
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
                    onClick: ()=>Get.to(item["screen"],
                    )
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
    {"name": "আমার বই", "image": Assets.mybook, "screen": const MyBooks()},
    {"name": "এডমিশন", "image": Assets.admission, "screen": const AdmissionScreen()},
    {"name": "পড়াশোনা", "image": Assets.study, "screen": const StudyScreen()},
    {"name": "আমার বই", "image": Assets.mybook, "screen": const MyBooks()},
    {"name": "এডমিশন", "image": Assets.admission, "screen": const AdmissionScreen()},
  ];
}
