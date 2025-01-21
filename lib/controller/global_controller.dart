import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<File> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: source);
    if(image != null) {
      return File(image.path);
    }else{
      return File('');
    }
  }

   Future<String> uploadImageToFirebaseStorage(File imageFile, String pathName) async {
    try {
      // Generating a unique path for the image
      var storageReference = FirebaseStorage.instance
          .ref()
          .child('$pathName/${DateTime.now().millisecondsSinceEpoch}');

      // Uploading the image data
      var uploadTask = storageReference.putFile(imageFile);

      // Awaiting the upload and fetching the download URL
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      print("Image uploaded successfully. Download URL: $downloadUrl");

      return downloadUrl; // Returning the image's download URL
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return ''; // Return empty string in case of an error
    }
  }

}
