import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/coupon_model.dart';

class CouponController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCouponList();
  }

  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    getAllCouponList();
  }



  Rx<TextEditingController> coupon = TextEditingController().obs;

  Rx<AllCoupontList> allCouponList = AllCoupontList().obs;
  Rx<SingleCoupon> selectedCoupon = SingleCoupon().obs;
  RxBool isLoading = false.obs;

  //get all coupon
  getAllCouponList()async{
    isLoading.value = true;
    var res = await ApiServices.getApi(AppConfig.COUPON_ALL); //get all coupon
    if(res.statusCode == 200){
      allCouponList.value = AllCoupontList.fromJson(jsonDecode(res.body));
    }
    isLoading.value = false;
  }

  //apply coupon with the allCouponList
  applyCoupon(){
    selectedCoupon.value = SingleCoupon();
    if(coupon.value.text.isEmpty){
      Get.snackbar("Error!", "Please enter a coupon code", backgroundColor: Colors.red);
      return;
    }

    bool couponMatch = allCouponList.value.data!.map((e) => e.code).contains(coupon.value.text);

    if(!couponMatch){
      Get.snackbar("Error!", "Invalid Coupon Code", backgroundColor: Colors.red);
      return;
    }else{
      Get.snackbar("Success!", "Coupon Applied Successfully.", backgroundColor: Colors.green);
    }

    for(var i in allCouponList.value.data!){
      if(i.code == coupon.value.text){
        selectedCoupon.value = i;
        return; //return if coupon found
      }
    }
  }
}