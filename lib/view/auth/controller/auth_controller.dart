import 'dart:convert';

import 'package:ebook_reader/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
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
      "phone": email.value.text,
      "password": pass.value.text
    });

    //check response ans show error
    if (response.statusCode == 200) {
      //save token
      isLogin.value = false;
      var data = jsonDecode(response.body);
      sharedPreferences!.setString("token", data["data"]["token"]);
      sharedPreferences!.setString("user_id", data["data"]["user"]["id"].toString());
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
      Get.snackbar("Error", "${jsonDecode(response.body)["message"]}",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }



  // logout
  logout()async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("token");
    _pref.remove("id");
    Get.offAllNamed(AppRoute.login);

  }

  //signin with google
  signInWithGoogle()async{
    //api call


   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = authResult.user;
    print("User: ${user!.displayName}");
    print("User: ${user.email}");
    print("User: ${user.phoneNumber}");

    if(user != null){
      isLoading.value = true;
      var response = await ApiServices.postApi(AppConfig.GOOGLE_LOGIN, {
        "name": user.displayName,
        "email": user.email,
        "phone": user.phoneNumber == null ? "" : user.phoneNumber,
      });
      if(response.statusCode == 200){
        if(jsonDecode(response.body)["data"]["user"]["status"] == "Pending"){
          Get.snackbar("Google Login!", "Your account is not active yet", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
          isLoading.value = false;
          return;
        }else{
          var data = jsonDecode(response.body);
          sharedPreferences!.setString("token", data["data"]["token"]);
          sharedPreferences!.setString("user_id", data["data"]["user"]["id"].toString());
          Get.snackbar("Success", "Login success", snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
          Get.offAllNamed(AppRoute.appNavigation); //navigate to app navigation
        }

      }else{
        Get.snackbar("Google Login!", "Google login failed", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
      isLoading.value = false;
    }else{
      Get.snackbar("Google Login!", "Google login failed", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }


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
