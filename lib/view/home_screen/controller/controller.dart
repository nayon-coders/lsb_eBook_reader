import 'package:get/get.dart';

import '../../../utility/app_assets.dart';
class HomeController extends GetxController{
  var imageList =[
    Assets.banner1,Assets.banner2,Assets.banner3,Assets.banner4
  ].obs;
  var currentIndex = 0.obs;

  void updateIndex(int index){
    currentIndex.value = index;
    update();
  }

}