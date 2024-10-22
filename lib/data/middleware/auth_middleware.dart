import 'package:ebook_reader/main.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check user authentication status
    return sharedPreferences!.getString("token") != null ? const RouteSettings(name: AppRoute.appNavigation) : const RouteSettings(name: AppRoute.login);
  }

  @override
  int? get priority => 1;
}
