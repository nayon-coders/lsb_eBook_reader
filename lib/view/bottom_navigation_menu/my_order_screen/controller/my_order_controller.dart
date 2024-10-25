import 'dart:convert';

import 'package:ebook_reader/data/services/api_services.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../model/get_my_order_model.dart';

class MyOrderController extends GetxController{
  //model
  Rx<GetMyOrderModel> getOrderModel = GetMyOrderModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyOrder();
  }

  @override
  onReady(){
    getMyOrder();
  }

  @override
  onClose(){
    super.onClose();
  }
  //RxBool
  RxBool isGetting = false.obs;

  //get my order list
  getMyOrder()async{
    isGetting.value= true;
    final res = await ApiServices.getApi(AppConfig.GET_MY_ORDER);
    if(res.statusCode == 200){
      print("Order get Successful");
      getOrderModel.value = GetMyOrderModel.fromJson(jsonDecode(res.body));
    }else{
      print("Failed :${jsonDecode(res.body)}");
    }
    isGetting.value = false;
  }


}