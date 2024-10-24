import 'package:ebook_reader/data/model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/get_shipping_address.dart';

class CreateOrderController extends GetxController {

  Rx<SinglePaymentMethod> selectedPaymentMethod = SinglePaymentMethod().obs;

  Rx<SingleAddressModel> selectedShippingAddress = SingleAddressModel().obs;



}