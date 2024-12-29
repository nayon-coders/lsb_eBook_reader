import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/routes/route_page.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
SharedPreferences? sharedPreferences;
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform
   );
   sharedPreferences = await SharedPreferences.getInstance() as SharedPreferences;
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   //sharedPreferences!.clear();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      getPages: RoutePage.routes,
      initialRoute: AppRoute.start,


    );
  }
}

