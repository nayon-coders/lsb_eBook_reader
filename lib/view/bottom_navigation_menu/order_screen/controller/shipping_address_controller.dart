import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/model/get_shipping_address.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShippingAddressController extends GetxController{

  //text Editing controller
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> address = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> district = TextEditingController().obs;
  Rx<TextEditingController> division = TextEditingController().obs;


  //Model
  Rx<ShippingAddressModel> getAddressModel = ShippingAddressModel().obs;



  //RxBool
  RxBool isAdding = false.obs;
  RxBool isLoading = false.obs;
  RxBool isGetting = false.obs;

  @override
  onInit(){
    super.onInit();
    getShippingAddress();
  }

  //onReady
  @override
  void onReady() {
    super.onReady();
    getShippingAddress();
  }
  //onClose
  @override
  void onClose() {
    super.onClose();
  }



  //add shipping address
  addShippingAddress()async{
    isLoading.value= true;
    final body ={
      "phone":phone.value.text,
      "address":address.value.text,
      "city":city.value.text,
      "district":district.value.text,
      "division":division.value.text,
    };
    final res = await ApiServices.postApi(AppConfig.ADD_SHIPPING_ADDRESS, body);
    if(res.statusCode == 200){
      Get.snackbar("Successful", "Address Add Successful",backgroundColor: Colors.green,colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",backgroundColor: Colors.green,colorText: Colors.white);

    }
    isLoading.value = false;

  }


  //get shipping address
  getShippingAddress()async{
    isGetting.value = true;
    final res = await ApiServices.getApi(AppConfig.GET_SHIPPING_ADDRESS);
    if(res.statusCode ==200){
      getAddressModel.value = shippingAddressModelFromJson(res.body);
      print("Address Get Successful");

    }else{
      print("Failed :${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;
  }



}