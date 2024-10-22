import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/screen/add_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/bottom_navigation_menu/order_screen/controller/shipping_address_controller.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ShippingAddressController>(()=> ShippingAddressController());
  }

}