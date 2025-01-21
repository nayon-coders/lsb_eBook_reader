import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/model/books_topics_model.dart';
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
  applyCoupon(int bookId)async{
    selectedCoupon.value = SingleCoupon();

    if(coupon.value.text.isEmpty){
      Get.snackbar("Error!", "Please enter a coupon code", backgroundColor: Colors.red);
      return;
    }

    print("bookId -- ${bookId}");

    bool couponMatch = allCouponList.value.data!.map((e) => e.code).contains(coupon.value.text);


    var today = DateTime.now();
    bool couponCodeValidaDate = allCouponList.value.data!.map((e) => e.isActive).contains(1);


    bool couponBookIdCheck = false;
    for(var i in allCouponList.value.data!){
      if(i.bookListForCoupons!.toString().contains(bookId.toString())){
        print("couponBookIdCheck -- ${i.bookListForCoupons}");
        couponBookIdCheck = true;
        break;
      }
    }

    print("couponBookIdCheck -- ${couponBookIdCheck}");
    print("couponBookIdCheck -- ${couponMatch}");
    print("couponBookIdCheck -- ${couponCodeValidaDate}");

    if(couponMatch && couponBookIdCheck){
      //check coupon valid code
      if(couponCodeValidaDate) {
        selectedCoupon.value = allCouponList.value.data!.firstWhere((element) => element.code == coupon.value.text);
        Get.snackbar("Success!", "Coupon Applied Successfully.",
            backgroundColor: Colors.green);
        return;
      }else{
        Get.snackbar("Error!", "Coupon is not valid", backgroundColor: Colors.red);
        return;
      }
      Get.snackbar("Success!", "Coupon Applied Successfully.", backgroundColor: Colors.green);
      return;
    }else{
      Get.snackbar("Error!", "Invalid Coupon Code", backgroundColor: Colors.red);
      return;

    }

    for(var i in allCouponList.value.data!){
      if(i.code == coupon.value.text){
        selectedCoupon.value = i;
        return; //return if coupon found
      }
    }
  }
}