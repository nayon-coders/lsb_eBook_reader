import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_const.dart';

import 'package:ebook_reader/widgets/not-find.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/single_book_model.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/app_shimmer_pro.dart';
import '../controller/book_controller.dart';

class TopicsScreen extends GetView<BookController> {
   TopicsScreen({super.key});

   var bookInfo = Get.arguments as BookInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text("${controller.chapterTopicModel.value.bookInfo!.bookName} - Topics",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),)
      ),
      body:Obx(() {
        if( controller.topicList.value.isEmpty){
          return NotFind();
        }else{
          return ListView.builder(
             // padding:const EdgeInsets.all(15),
              itemCount: controller.topicList.value.length,
              itemBuilder: (context,index){
                var data = controller.topicList.value[index];
                return Container(
                  padding:const EdgeInsets.only(left: 10,right: 10),
                  margin:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset:const Offset(0,1.5),
                          color: data.lookStatus == AppConst.lock ?  Colors.grey.shade400  : Colors.white
                      )
                    ],

                    color:  data.lookStatus == AppConst.lock ?  Colors.grey.shade200  : Colors.white
                  ),
                  child: ListTile(
                    onTap: ()=>data.lookStatus == AppConst.lock ? null : Get.toNamed(AppRoute.readingScreen,arguments: {"bookInfo":bookInfo,"id":data.id.toString()}),
                    contentPadding: EdgeInsets.zero,
                    tileColor: Colors.white,
                    leading: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text("${index+1}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),)),
                    ),
                    title: Text("${data.name}",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                    subtitle: Text("${data.pageNumber} Page",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
                    trailing:  Icon(data.lookStatus == AppConst.lock ? Icons.lock : Icons.double_arrow,color: AppColors.buttonGreen,),
                  ),
                );

              });
        }

        }
      ),


    );
  }
}
