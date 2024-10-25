import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/data/model/get_shipping_address.dart';
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



  //RxBool
  RxBool isAdding = false.obs;
  RxBool isLoading = false.obs;
  RxBool isGetting = false.obs;
  RxBool isDeleting = false.obs;

  RxString id = "".obs;

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

  Rx<ShippingAddressModel> getAddressModel = ShippingAddressModel().obs;



  //add shipping address
  addShippingAddress()async{
    isLoading.value= true;
    final body ={
      "phone":phone.value.text,
      "address":address.value.text,
      "city":city.value.text,
      "district": district.value.text,
      "division": division.value.text,
    };
    final res = await ApiServices.postApi(AppConfig.ADD_SHIPPING_ADDRESS, body);
    if(res.statusCode == 200){
      getShippingAddress();
      Get.back();
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
      getAddressModel.value = ShippingAddressModel.fromJson(jsonDecode(res.body));
      print("Address Get Successful");
    }else{
      print("Failed :${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;
  }

  //DELETE SHIPPING ADDRESS
  deleteShippingAddress(id)async{
    isDeleting.value = true;
    final res = await ApiServices.deleteApi(AppConfig.DELETE_SHIPPING_ADDRESS+id);
    if(res.statusCode == 200){
      getShippingAddress();
      Get.snackbar("Successful", "Delete Successful",backgroundColor: Colors.green);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}");
    }
    isDeleting.value = false;

  }


  //edit shipping address
  editShippingAddress(data)async{
    isLoading.value = true;
    var res = await ApiServices.putApi(AppConfig.UPDATE_SHIPPING_ADDRESS+id.value, {
      "phone":phone.value.text,
      "address":address.value.text,
      "city":city.value.text,
      "district": district.value.text,
      "division": division.value.text,
    });

    if(res.statusCode == 200) {
      isEditing.value = false;
      id.value = "";
      clearAll();
      getShippingAddress();
      Get.back();
      Get.snackbar("Successful", "Address Update Successful",
          backgroundColor: Colors.green, colorText: Colors.white);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}",
          backgroundColor: Colors.green, colorText: Colors.white);
    }

    isLoading.value = false;
  }

  RxBool isEditing = false.obs;
  //edit value save
  editValueSave(data){
    id.value = data.id.toString();
    isEditing.value = true;
    phone.value.text = data.phone!;
    address.value.text = data.address!;
    city.value.text = data.city!;
    district.value.text = data.district!;
    division.value.text = data.division!;

    print("district --- ${district.value.text}");
  }

  //clear all text field
  clearAll(){
    phone.value.clear();
    address.value.clear();
    city.value.clear();
    district.value.clear();
    division.value.clear();
  }


}