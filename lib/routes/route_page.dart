
import 'package:ebook_reader/data/binding/reading_binding.dart';
import 'package:ebook_reader/data/middleware/auth_middleware.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/auth/login_screen.dart';
import 'package:ebook_reader/view/auth/signup_screen.dart';
import 'package:ebook_reader/view/auth/start_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/all_books/all_books.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/favorite_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/home_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/screen/my_order_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/screen/my_single_book.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/profile_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/about_us.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/contact_us.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/edit_profile.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/privacy_policy.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/return_policy.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/terms_condition.dart';
import 'package:get/get.dart';

import '../data/binding/auth_binding.dart';
import '../data/binding/book_controller_binding.dart';
import '../data/binding/home_binding.dart';
import '../data/binding/order_create_binding.dart';
import '../data/binding/profile_binding.dart';
import '../data/middleware/connection_mideleare.dart';
import '../view/bottom_navigation_menu/app_navigation_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/capter_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/catagory_books.dart';
import '../view/bottom_navigation_menu/category_screen/screen/reading_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/single_book_screen.dart';
import '../view/bottom_navigation_menu/category_screen/screen/topics_screen.dart';
import '../view/offline_mode/view/offline_my_book.dart';
import '../view/offline_mode/view/offline_pages.dart';
import '../view/offline_mode/view/read_pdf.dart';
import '../view/order_screen/screen/add_address.dart';
import '../view/order_screen/screen/order_screen.dart';
class RoutePage{
  static List<GetPage<dynamic>> routes=[


    GetPage(
        name: AppRoute.start,
        page: ()=> StartScreen(),
        middlewares: [AuthMiddleware(), ConnectionMiddleware()]
    ),
 GetPage(
        name: AppRoute.OfflinePages,
        page: ()=> OfflinePages(),
        middlewares: [ ConnectionMiddleware()]
    ),

    GetPage(
        name: AppRoute.offLineMode,
        page: ()=> OffLineReadPdf(),
        //middlewares: [AuthMiddleware()]
    ),
    GetPage(
        name: AppRoute.OfflineMyBook,
        page: ()=> OfflineMyBook(),
        //middlewares: [AuthMiddleware()]
    ),

    GetPage(
      name: AppRoute.login,
      page: ()=> LoginScreen(),
      binding: AuthBinding(),
      middlewares: [ConnectionMiddleware()]
    ),
    GetPage(
      name: AppRoute.signup,
      page: ()=> SignupScreen(),
      binding: AuthBinding(),
        middlewares: [ConnectionMiddleware()]
    ),

    //Navigation
    GetPage(
        name: AppRoute.appNavigation,
        page: ()=>AppNavigationScreen(),
        bindings: [HomeBinding()],
        middlewares: [ ConnectionMiddleware()]
    ),
    GetPage(
        name: AppRoute.myOrderScreen,
        page: ()=>MyOrderScreen(),
        binding: HomeBinding() ,
        middlewares: [ ConnectionMiddleware()]
    ),
    GetPage(
      name: AppRoute.favoriteBooks,
      page: ()=>FavoriteScreen(),
        middlewares: [ConnectionMiddleware()]
    //  binding: HomeBinding(),

    ),
    GetPage(
      name: AppRoute.allBooks,
      page: ()=>AllBooks(),
      binding: HomeBinding(),
        middlewares: [ConnectionMiddleware()]

    ),
    GetPage(
      name: AppRoute.homeScreen,
      page: ()=>HomeScreen(),
      binding: HomeBinding(),
        middlewares: [ConnectionMiddleware()]

    ),
    GetPage(
      name: AppRoute.profileScreen,
      page: ()=>ProfileScreen(),
      binding: HomeBinding(),
        middlewares: [ConnectionMiddleware()]

    ),






    GetPage(
        name: AppRoute.orderScreen,
        page: ()=>OrderScreen(),
      bindings: [OrderCreateBinding()],
        middlewares: [ConnectionMiddleware()]

    ),


    //edit profile
    GetPage(
        name: AppRoute.editProfile,
        page: ()=>EditProfile(),
       binding:ProfileBinding(),
        middlewares: [ConnectionMiddleware()]
    ),


    //CateGory books
    GetPage(
        name: AppRoute.categoryBook,
        page: ()=>CategoryBook(),
       binding: BookControllerBinding(),
        middlewares: [ConnectionMiddleware()]
    ),
    //all books
    GetPage(
        name: AppRoute.singleBook,
        page: ()=>SingleBookScreen(),
       binding: BookControllerBinding(),
        middlewares: [ConnectionMiddleware()]
    ),
    GetPage(
        name: AppRoute.mySingleBook,
        page: ()=>MySingleBookScreen(),
       binding: BookControllerBinding(),
        middlewares: [ConnectionMiddleware()]
    ),
    GetPage(
        name: AppRoute.chapter,
        page: ()=>ChapterScreen(),
       binding: BookControllerBinding(),
        middlewares: [ConnectionMiddleware()]
    ),
    GetPage(
        name: AppRoute.topics,
        page: ()=>TopicsScreen(),
        binding: BookControllerBinding(),
        middlewares: [ConnectionMiddleware()]
    ),
    GetPage(
        name: AppRoute.readingScreen,
        page: ()=>ReadingScreen(),
        binding: ReadingBinding(),
        middlewares: [ConnectionMiddleware()]
    ),


    GetPage(
      name: AppRoute.addShippingAddress,
      page: ()=>AddAddress(),
      binding: OrderCreateBinding(),
        middlewares: [ConnectionMiddleware()]

    ),


    GetPage(name: AppRoute.aboutUs, page: ()=>AboutUs()),
    GetPage(name: AppRoute.contactUs, page: ()=>ContactUs()),
    GetPage(name: AppRoute.privacyPolicy, page: ()=>PrivacyPolicy()),
    GetPage(name: AppRoute.returnPolicy, page: ()=>ReturnPolicy()),
    GetPage(name: AppRoute.termsCondition, page: ()=>TermsCondition()),
  ];
}