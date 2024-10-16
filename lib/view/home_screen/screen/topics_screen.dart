import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/app_color.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title:const Text("Book Night - Topics",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
      ),
      body:ListView.builder(
          padding:const EdgeInsets.all(15),
          itemCount: 15,
          itemBuilder: (context,index){
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
                      color: Colors.grey.shade400
                  )
                ],

                color: Colors.white,
              ),
              child: ListTile(
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
                title: Text("Topics name",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                subtitle: Text("14 Page, 145 meaning",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textBlack),),
                trailing: const Icon(Icons.double_arrow,color: AppColors.buttonGreen,),
              ),
            );

          }),


    ));
  }
}
