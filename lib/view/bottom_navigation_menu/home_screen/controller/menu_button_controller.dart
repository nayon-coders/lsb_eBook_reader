//menu routing with text
import 'package:get/get.dart';

import '../../../../routes/route_name.dart';
import '../../controller/navigation_controller.dart';

NavController navController = Get.find();

void homeMenuRouting(String text){
  switch(text){
    case "পড়াশোনা":
      Get.toNamed(AppRoute.allBooks);
      break;
    case "আমার বই":
      navController.changeIndex(1);
    //  navController.currentIndex.value = 1;
      break;
    case "এডমিশন":
      Get.toNamed("/listen");
      break;
    case "Watch":
      Get.toNamed("/watch");
      break;
  }
}
