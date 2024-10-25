import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/controller/favorite_book_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/controller/controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/favroit_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../view/bottom_navigation_menu/category_screen/controller/book_controller.dart';
import '../../view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';

//home binding
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<FavoriteBookController>(() => FavoriteBookController());
    Get.lazyPut<FavroitController>(() => FavroitController());
    Get.lazyPut<MyOrderController>(() => MyOrderController());
  }
}