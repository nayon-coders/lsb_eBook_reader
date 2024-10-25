import 'dart:convert';
import 'dart:io';
import 'package:ebook_reader/data/global_controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app_config.dart';
import '../../../../data/model/my_profile_model.dart';
import '../../../../data/services/api_services.dart';
import '../../../../main.dart';
import '../../../../routes/route_name.dart';
import 'package:http/http.dart' as http;
class ProfileController extends GetxController{

  //oninit
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }
  //onReady
  @override
  void onReady() {
    super.onReady();
    getUserInfo();

  }
  //onClose
  @override
  void onClose() {
    super.onClose();
  }


  //model rx
  var myProfileModel = MyProfileModel().obs;



  //text editing controller
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> pass = TextEditingController().obs;
  Rx<TextEditingController> confirmPass = TextEditingController().obs;
  Rx<TextEditingController> address = TextEditingController().obs;
  RxList  items = ["student","teacher","banker"].obs;
  RxString selectedItem = "student".obs;
  RxBool show = false.obs;

  //image
  File? selectedImage;
  final picker = ImagePicker();


  //loading rx
  var isLoading = false.obs;
  var isLogin = false.obs;
  var isRegister = false.obs;




  getUserInfo() async {
    isLoading.value = true;

    // API call
    var response = await ApiServices.getApi(AppConfig.USER_GET);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      isLoading.value = false;

      // Parse the profile model
      var profile = MyProfileModel.fromJson(data);
      GlobalVariables.gMyProfileModel.value = profile;
      myProfileModel.value = profile;

      // Ensure that 'data' and 'user' are not null before accessing them
      if (myProfileModel.value != null) {
        // Assign values to the text editing controllers safely
        name.value.text = myProfileModel.value.name ?? 'No Name';
        email.value.text = myProfileModel.value.email ?? 'No Email';
        phone.value.text = myProfileModel.value.phone ?? 'No Phone';
        //address.value.text = myProfileModel.value. ?? 'No Address';

      } else {
        // Handle null case for user or data
        print('User data is null');
        Get.snackbar('Error', 'User information could not be loaded');
      }
    } else {
      isLoading.value = false;
      // Handle error
      Get.snackbar('Error', 'Failed to load user information');
    }
  }




  //update user info
  updateUserInfo()async {
    isLoading.value = true;
    //api call
    var response = await ApiServices.putApi(AppConfig.USER_UPDATE, {
      "name": name.value.text,
      "email": email.value.text,
      "phone": phone.value.text
    });

    //check response ans show error
    if (response.statusCode == 200) {
      //save token
      var data = jsonDecode(response.body);
      getUserInfo();
      isLoading.value = false;
      Get.back();
      //show get.snackbar
      Get.snackbar(
          "Success", "Update success", snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green);

    } else {
      isLoading.value = false;
      Get.snackbar("Error", "Invalid email or password",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }

  //image selected



  //update user password
  updateUserPassword(id)async {
    isLoading.value = true;
    //api call
    var response = await ApiServices.putApi(AppConfig.USER_PASS_UPDATE+id, {
      "password": pass.value.text
    });

    //check response ans show error
    if (response.statusCode == 200) {
      //save token
      var data = jsonDecode(response.body);
      getUserInfo();
      isLoading.value = false;
      //show get.snackbar
      Get.snackbar(
          "Success", "Update success", snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green);
    } else {
      isLoading.value = false;
      Get.snackbar("Error", "Invalid email or password",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }


  //delete user
  deleteUser()async {
    isLoading.value = true;

    SharedPreferences _pref =await SharedPreferences.getInstance();
    final id =_pref.getString("id");
    //api call
    var response = await ApiServices.deleteApi(AppConfig.USER_DELETE+id!);

    //check response ans show error
    if (response.statusCode == 200) {
      //save token
      var data = jsonDecode(response.body);
      sharedPreferences!.remove("token");
      isLoading.value = false;
      //show get.snackbar
      Get.snackbar(
          "Success", "Delete success", snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green);
      Get.offAllNamed(AppRoute.login);
    } else {
      isLoading.value = false;
      Get.snackbar("Error", "Invalid email or password",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }





}