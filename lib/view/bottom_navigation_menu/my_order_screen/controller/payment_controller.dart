import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:get/get.dart';

import '../../../../data/model/payment_model.dart';

class PaymentController extends GetxController {



  @override
  void onInit() {
    super.onInit();
    getPaymentInfo();
  }

  //on ready
  @override
  void onReady() {
    super.onReady();
    getPaymentInfo();
  }


  Rx<PaymentMolde> paymentModel = PaymentMolde().obs;
  RxBool isLoading = false.obs;


  //get payement info from api
  Future<void> getPaymentInfo() async {
    isLoading.value = true;
    var res = await ApiServices.getApi(AppConfig.PAYMENT_GET);
    if(res.statusCode == 200){
      paymentModel.value = PaymentMolde.fromJson(jsonDecode(res.body));
    }
    isLoading.value = false;
    //api call
  }


}