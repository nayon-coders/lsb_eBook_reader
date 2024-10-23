
import 'package:ebook_reader/data/binding/order_binding.dart';
import 'package:ebook_reader/data/binding/reading_binding.dart';
import 'package:ebook_reader/data/middleware/auth_middleware.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/auth/login_screen.dart';
import 'package:ebook_reader/view/auth/signup_screen.dart';
import 'package:ebook_reader/view/auth/start_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/screen/reading_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/screen/single_book_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/screen/capter_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/screen/topics_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/favorite_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/controller/my_order_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/my_order_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/order_screen/screen/add_address.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/edit_profile.dart';
import 'package:get/get.dart';

import '../data/binding/auth_binding.dart';
import '../data/binding/book_controller_binding.dart';
import '../data/binding/home_binding.dart';
import '../data/binding/profile_binding.dart';
import '../view/bottom_navigation_menu/app_navigation_screen.dart';
import '../view/bottom_navigation_menu/books_screen/screen/all_books_screen.dart';
import '../view/bottom_navigation_menu/order_screen/order_screen.dart';
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
        binding: HomeBinding()
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
        name: AppRoute.orderScreen,
        page: ()=>OrderScreen(),
      binding: OrderBinding(),

    ),


    //edit progile
    GetPage(
        name: AppRoute.editProfile,
        page: ()=>EditProfile(),
       binding:ProfileBinding()
    ),


    //all books
    GetPage(
        name: AppRoute.allBooks,
        page: ()=>AllBooksScreen(),
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
      binding: OrderBinding(),

    ),
  ];
}