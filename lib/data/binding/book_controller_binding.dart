import 'package:get/get.dart';

import '../../view/bottom_navigation_menu/category_screen/controller/book_controller.dart';


class BookControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookController>(() => BookController());
  }
}