import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/model/payment_model.dart';
import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/utility/app_const.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';
import 'package:ebook_reader/view/order_screen/screen/order_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/get_shipping_address.dart';

class CreateOrderController extends GetxController {

  //my order controller find
  final MyOrderController myOrderController = Get.put(MyOrderController());

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
  RxDouble paymentCharge = 0.0.obs;
  //calculate total amount
  void calculateTotalAmount(){


    print("Total Amount: ${totalAmount.value}");
    print("discountAmount.value Amount: ${discountAmount.value}");
    if (selectedShippingAddress.value.city != null && selectedShippingAddress.value.division != null) {
      if (selectedShippingAddress.value.division!.toLowerCase().contains("dhaka")) {
        deliveryCharge.value = AppConst.deliveryFeeInsideDhaka;
      } else {
        deliveryCharge.value = AppConst.deliveryFeeOutsideDhaka;
      }
    }
    subtotal.value = productPrice.value;
    totalAmount.value = productPrice.value + deliveryCharge.value - discountAmount.value;

    print("Total Amount: ${paymentCharge.value}");
  }

  //set payment charge
  setPaymentCharge(){
    paymentCharge.value = 0.00; //clear previous charge
    //check selected payment method
    if (selectedPaymentMethod.value.charge != null) {
      paymentCharge.value = (totalAmount.value / 100) * selectedPaymentMethod.value.charge!;
    }

  }


  //place order
  RxBool isCreatingOrder = false.obs;
  void placeOrder(BookInfo bookInfo)async{
    isCreatingOrder.value = true;
    var data = {
      "book_id": bookInfo.bookId.toString(),
      "price": bookInfo.price!.toString(),
      "delivery_address_id": "-1",
      "delivery_fee": deliveryCharge.value.toString(),
      "quantity": "1",
      "total_price": (totalAmount.value + paymentCharge.value).toStringAsFixed(2),
      "payment_method" : selectedPaymentMethod.value.methodName!.toString(),
      "transection_id" : payTransId.value.text,
      "number" : payNumber.value.text,
      "send_to" : selectedPaymentMethod.value.acocuntNumber!.toString(),
      "discount_price" : discountAmount.value.toString(),
    };
    print("Place Order Data: ${data}");
   var res = await ApiServices.postApi(AppConfig.PLACE_ORDER, data);
    if(res.statusCode == 200){
      clearAll(); //clear all
      myOrderController.getMyOrder(); //refresh my order
     Get.snackbar("Success!", "Order placed successfully", backgroundColor: Colors.green);
     Get.to(OrderSuccess(), transition: Transition.downToUp);
    }else{
      Get.snackbar("Error!", "Failed to place order: Status Code: ${res.statusCode}", backgroundColor: Colors.red);
    }
    isCreatingOrder.value = false;
  }





  //clear all
  void clearAll(){
    selectedPaymentMethod.value = SinglePaymentMethod();
    selectedShippingAddress.value = SingleAddressModel();
    payNumber.value.clear();
    payTransId.value.clear();
    totalAmount.value = 0.0;
    subtotal.value = 0.0;
    discountAmount.value = 0.0;
    deliveryCharge.value = 0.0;
    productPrice.value = 0.0;
    paymentCharge.value = 0.0;

  }

}