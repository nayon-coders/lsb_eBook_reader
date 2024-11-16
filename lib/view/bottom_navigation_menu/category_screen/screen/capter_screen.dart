import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_const.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/single_book_model.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/not-find.dart';
import '../controller/book_controller.dart';

class ChapterScreen extends GetView<BookController> {
   ChapterScreen({super.key});

  var bookInfo = Get.arguments["data"] as BookInfo;
  bool allPermission = Get.arguments["allPermission"] as bool;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.bookId.value = bookInfo.bookId.toString();
      controller.getAllTopic();
    });
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
       backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text("${bookInfo.bookName}",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),)
      ),
      body:Obx(() {
        if(controller.isLoading.value){
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return AppShimmerPro.circularShimmer(width: size.width, height: 70, borderRadius: 10,);
            },
          );
        }else if(controller.chapterTopicModel.value.data == null ||  controller.chapterTopicModel.value.data!.isEmpty){
          return NotFind(
            title: "খুঁজে পাওয়া যাচ্ছে না!",
          );
        }else{
          return _buildChapterListView();
        }

        }),

    );
  }

  ListView _buildChapterListView() {
    return ListView.builder(
       // padding:const EdgeInsets.all(5.0),
        itemCount: controller.chapterTopicModel.value.data!.length,
        itemBuilder: (context,index){
          var data = controller.chapterTopicModel.value.data![index];
          return Container(
            padding:const EdgeInsets.only(left: 10,right: 10),
            margin:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset:  Offset(0,1.5),
                    color: Colors.grey.shade400
                )
              ],
              color: allPermission ?  Colors.white : data.lookStatus.toString().toLowerCase() != AppConst.lock.toLowerCase() ? Colors.white : Colors.grey.shade200,
            ),
            child: ListTile(
              onTap: (){
                if(allPermission ){
                  controller.topicList.value = data.subTocs!;
                  Get.toNamed(AppRoute.topics, arguments: {"data":bookInfo, "allPermission":allPermission});
                }else if( data.lookStatus != AppConst.lock){
                  controller.topicList.value = data.subTocs!;
                  Get.toNamed(AppRoute.topics, arguments: {"data":bookInfo, "allPermission":allPermission});
                }else{
                  return null;
                }

              },
              contentPadding: EdgeInsets.zero,
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
              subtitle: Text("${data.subTocs!.length} Topics",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
              trailing: Icon( allPermission ?  Icons.double_arrow :  data.lookStatus.toString().toLowerCase() != AppConst.lock.toLowerCase() ? Icons.double_arrow :  Icons.lock,color: AppColors.buttonGreen,),
            ),
          );
        });
  }
}
