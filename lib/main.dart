import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/routes/route_page.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      getPages: RoutePage.routes,
      initialRoute: RouteName.start,


    );
  }
}

