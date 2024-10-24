import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/model/banner_model.dart';
import 'package:get/get.dart';

import '../../../../utility/app_assets.dart';
class HomeController extends GetxController{

  //model
  Rx<GetAllBanner> getBannerModel = GetAllBanner().obs;


  //bool
  RxBool isGetting = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getbanner();
  }


  var imageList =[
    Assets.banner1,Assets.banner2,Assets.banner3,Assets.banner4
  ].obs;
  var currentIndex = 0.obs;

  void updateIndex(int index){
    currentIndex.value = index;
    update();
  }


  //get banner
  getbanner()async{
    isGetting.value = true;
    final res =await ApiServices.getApi(AppConfig.GET_ALL_BANNER);
    if(res.statusCode == 200){
      print("Get Banner Successful");
      getBannerModel.value = getAllBannerFromJson(res.body);
    }else{
      print("failed : ${jsonDecode(res.body)["message"]}");
    }
    isGetting.value = false;

  }



}