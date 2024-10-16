
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/app_navigation_screen/app_navigation_screen.dart';
import 'package:ebook_reader/view/auth/login_screen.dart';
import 'package:ebook_reader/view/auth/signup_screen.dart';
import 'package:ebook_reader/view/auth/start_screen.dart';
import 'package:ebook_reader/view/order_screen/order_screen.dart';
import 'package:get/get.dart';
class RoutePage{
  static List<GetPage<dynamic>> routes=[

    GetPage(
        name: RouteName.start,
        page: ()=> StartScreen(),
    ),

    GetPage(
      name: RouteName.login,
      page: ()=> LoginScreen(),
    ),
    GetPage(
      name: RouteName.signup,
      page: ()=> SignupScreen(),
    ),
    GetPage(
        name: RouteName.appNavigation,
        page: ()=>AppNavigationScreen()
    ),
    GetPage(
        name: RouteName.orderScreen,
        page: ()=>OrderScreen()
    ),
  ];
}