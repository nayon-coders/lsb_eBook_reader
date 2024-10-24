import 'dart:convert';

import 'package:ebook_reader/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
import '../../../data/model/my_profile_model.dart';
import '../../../data/services/api_services.dart';
import '../../../main.dart';
class AuthController extends GetxController{

  //on init
  @override
  void onInit() {
    super.onInit();
  }

  //on close
  @override
  void onClose() {
    super.onClose();
  }

  //on ready
  @override
  void onReady() {
    super.onReady();
  }


  //text editing controller
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> pass = TextEditingController().obs;
  Rx<TextEditingController> confirmPass = TextEditingController().obs;
  RxBool show = false.obs;

  //loading rx
  var isLoading = false.obs;
  var isLogin = false.obs;
  var isRegister = false.obs;




  //login api
  login()async {
    isLogin.value = true;
    //api call
    var response = await ApiServices.postApi(AppConfig.LOGIN, {
      "email": email.value.text,
      "password": pass.value.text
    });

    //check response ans show error
    if (response.statusCode == 200) {
      //save token
      isLogin.value = false;
      var data = jsonDecode(response.body);
      sharedPreferences!.setString("token", data["data"]["token"]);
      sharedPreferences!.setString("token", data["data"]["user"]["id"]);
      isLogin.value = false;
      clearAll();
      //show get.snackbar
      Get.snackbar("Success", "Login success", snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      Get.offAllNamed(AppRoute.appNavigation);
    } else {
      isLogin.value = false;
      Get.snackbar("Error", "Invalid email or password", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }


  //register api
  register()async {
    isRegister.value = true;
    //api call
    var response = await ApiServices.postApi(AppConfig.REGISTER, {
      "name": name.value.text,
      "email": email.value.text,
      "password": pass.value.text,
      "phone": phone.value.text
    });

    //check response ans show error
    if (response.statusCode == 200) {
      isRegister.value = false;
      //save token
      var data = jsonDecode(response.body);
      sharedPreferences!.setString("token", data["data"]["token"]);

      clearAll();
      //show get.snackbar
      Get.snackbar(
          "Success", "Register success", snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green);
      Get.offAllNamed(AppRoute.appNavigation);
    } else {
      isRegister.value = false;
      Get.snackbar("Error", "Invalid email or password",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }



  // logout
  logout()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("token");
    _pref.remove("id");
    Get.offAllNamed(AppRoute.login);

  }

  //clear all input feild
  clearAll() {
    name.value.clear();
    phone.value.clear();
    email.value.clear();
    pass.value.clear();
    confirmPass.value.clear();
  }


  }
