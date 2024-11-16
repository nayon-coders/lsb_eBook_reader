import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/coupon_controller.dart';
import 'package:ebook_reader/view/order_screen/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/order_screen/controller/shipping_address_controller.dart';

class OrderCreateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(()=> PaymentController());
    Get.lazyPut<ShippingAddressController>(()=> ShippingAddressController());
    Get.lazyPut<CouponController>(()=> CouponController());
  }

}