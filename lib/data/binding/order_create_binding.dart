import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/payment_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/screen/add_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/bottom_navigation_menu/order_screen/controller/shipping_address_controller.dart';

class OrderCreateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(()=> PaymentController());
    Get.lazyPut<ShippingAddressController>(()=> ShippingAddressController());
  }

}