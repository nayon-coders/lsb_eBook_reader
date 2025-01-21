import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook_reader/main.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check user authentication status
    if (sharedPreferences!.getString("token") != null) {
      return const RouteSettings(name: AppRoute.appNavigation);
    } else {
      // User is not authenticated, redirect to login
      return const RouteSettings(name: AppRoute.login);
    }
  }

  @override
  int? get priority => 1;
}
