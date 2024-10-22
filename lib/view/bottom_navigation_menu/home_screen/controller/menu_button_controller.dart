//menu routing with text
import 'package:get/get.dart';

import '../../../../routes/route_name.dart';

void homeMenuRouting(String text){
  switch(text){
    case "পড়াশোনা":
      Get.toNamed(AppRoute.allBooks);
      break;
    case "আমার বই":
      Get.toNamed("/read");
      break;
    case "এডমিশন":
      Get.toNamed("/listen");
      break;
    case "Watch":
      Get.toNamed("/watch");
      break;
  }
}
