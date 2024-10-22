import 'package:get/get.dart';

import '../../view/bottom_navigation_menu/profile_screen/controller/favroit_controller.dart';
import '../../view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<FavroitController>(() => FavroitController());

  }
}