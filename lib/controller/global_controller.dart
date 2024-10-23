import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController{
  static showImageDialog(VoidCallback onCamera, VoidCallback onGallery,){
    return Get.bottomSheet(
      Container(
        padding:const EdgeInsets.all(30),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Choose an option",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
            ),
            ListTile(
              leading:const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: onCamera,
            ),
            ListTile(
              leading:const Icon(Icons.photo),
              title:const Text('Gallery'),
              onTap: onGallery,
            ),

          ],
        ),
      ),
    );

  }
}
