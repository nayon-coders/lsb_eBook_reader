
import 'package:ebook_reader/data/binding/order_binding.dart';
import 'package:ebook_reader/data/binding/reading_binding.dart';
import 'package:ebook_reader/data/middleware/auth_middleware.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/auth/login_screen.dart';
import 'package:ebook_reader/view/auth/signup_screen.dart';
import 'package:ebook_reader/view/auth/start_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/all_books/all_books.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/favorite_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/home_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/my_order_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/screen/add_address.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/profile_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/edit_profile.dart';
import 'package:get/get.dart';

import '../data/binding/auth_binding.dart';
import '../data/binding/book_controller_binding.dart';
import '../data/binding/home_binding.dart';
import '../data/binding/order_create_binding.dart';
import '../data/binding/profile_binding.dart';
import '../view/bottom_navigation_menu/app_navigation_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/capter_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/catagory_books.dart';
import '../view/bottom_navigation_menu/category_screen/screen/reading_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/single_book_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/topics_screen.dart';
import '../view/bottom_navigation_menu/order_screen/screen/order_screen.dart';
class RoutePage{
  static List<GetPage<dynamic>> routes=[

    GetPage(
        name: AppRoute.start,
        page: ()=> StartScreen(),
        middlewares: [AuthMiddleware()]
    ),

    GetPage(
      name: AppRoute.login,
      page: ()=> LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.signup,
      page: ()=> SignupScreen(),
      binding: AuthBinding(),
    ),

    //Navigation
    GetPage(
        name: AppRoute.appNavigation,
        page: ()=>AppNavigationScreen(),
        bindings: [HomeBinding(), OrderBinding()]
    ),
    GetPage(
        name: AppRoute.myOrderScreen,
        page: ()=>MyOrderScreen(),
        binding: HomeBinding()
    ),
    GetPage(
      name: AppRoute.favoriteBooks,
      page: ()=>FavoriteScreen(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: AppRoute.allBooks,
      page: ()=>AllBooks(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: AppRoute.homeScreen,
      page: ()=>HomeScreen(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: AppRoute.profileScreen,
      page: ()=>ProfileScreen(),
      binding: HomeBinding(),

    ),






    GetPage(
        name: AppRoute.orderScreen,
        page: ()=>OrderScreen(),
      binding: OrderCreateBinding(),

    ),


    //edit profile
    GetPage(
        name: AppRoute.editProfile,
        page: ()=>EditProfile(),
       binding:ProfileBinding()
    ),


    //CateGory books
    GetPage(
        name: AppRoute.categoryBook,
        page: ()=>CategoryBook(),
       binding: BookControllerBinding()
    ),
    //all books
    GetPage(
        name: AppRoute.singleBook,
        page: ()=>SingleBookScreen(),
       binding: BookControllerBinding()
    ),
    GetPage(
        name: AppRoute.chapter,
        page: ()=>ChapterScreen(),
       binding: BookControllerBinding()
    ),
    GetPage(
        name: AppRoute.topics,
        page: ()=>TopicsScreen(),
        binding: BookControllerBinding()
    ),
    GetPage(
        name: AppRoute.readingScreen,
        page: ()=>ReadingScreen(),
        binding: ReadingBinding()
    ),


    GetPage(
      name: AppRoute.addShippingAddress,
      page: ()=>AddAddress(),
      binding: OrderCreateBinding(),

    ),
  ];
}