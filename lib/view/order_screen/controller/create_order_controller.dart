import 'package:ebook_reader/data/model/payment_model.dart';
import 'package:ebook_reader/utility/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/get_shipping_address.dart';

class CreateOrderController extends GetxController {

  //on close
  @override
  void onClose() {
    clearAll();
    super.onClose();
  }


  Rx<SinglePaymentMethod> selectedPaymentMethod = SinglePaymentMethod().obs;

  Rx<SingleAddressModel> selectedShippingAddress = SingleAddressModel().obs;

  Rx<TextEditingController> payNumber = TextEditingController().obs;
  Rx<TextEditingController> payTransId = TextEditingController().obs;


  RxDouble totalAmount = 0.0.obs;
  RxDouble subtotal = 0.0.obs;
  RxDouble discountAmount = 0.0.obs;
  RxDouble deliveryCharge = 0.0.obs;
  RxDouble productPrice = 0.0.obs;
  //calculate total amount
  void calculateTotalAmount(){
    print("Total Amount: ${totalAmount.value}");
    if (selectedShippingAddress.value.city != null && selectedShippingAddress.value.division != null) {
      if (selectedShippingAddress.value.division!.toLowerCase().contains("dhaka")) {
        deliveryCharge.value = AppConst.deliveryFeeInsideDhaka;
      } else {
        deliveryCharge.value = AppConst.deliveryFeeOutsideDhaka;
      }
    }


    print("deliveryCharge.value --- ${deliveryCharge.value}");

    subtotal.value = productPrice.value;
    totalAmount.value = productPrice.value + deliveryCharge.value - discountAmount.value;
    print("Total Amount: ${totalAmount.value}");
  }





  //clear all
  void clearAll(){
    selectedPaymentMethod.value = SinglePaymentMethod();
    selectedShippingAddress.value = SingleAddressModel();
  }

}