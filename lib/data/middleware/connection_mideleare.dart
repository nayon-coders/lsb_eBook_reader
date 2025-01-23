import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook_reader/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook_reader/routes/route_name.dart';

class ConnectionMiddleware extends GetMiddleware {
  final Connectivity _connectivity = Connectivity();


  ConnectionMiddleware() {
    sharedPreferences!.setBool("isOnline", true); // Set online status to false

    // Listen to connectivity changes
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      _handleConnectivityChange(result);
    }); // Correct type used here
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    print("result -- ${result}");
    if (result.contains(ConnectivityResult.none)) {

      // Redirect to offline mode


      if(sharedPreferences!.getBool("isOnline") == false){
        sharedPreferences!.setBool("isOnline", true);
        Get.snackbar(
          "No Internet Connection",
          "Please check your connection.",
          duration: Duration(hours: 5),
          mainButton: TextButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.OfflinePages);
              Get.back();
            },
            child: Text("Go Offline"),
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } else {

      // Connection restored
      if(sharedPreferences!.getBool("isOnline") == true){
        sharedPreferences!.setBool("isOnline", false);


        // Get.snackbar(
        //   "Online",
        //   "You are back online.",
        //   duration: Duration(hours: 5),
        //   mainButton: TextButton(
        //     onPressed: () {
        //       Get.offAllNamed(AppRoute.start);
        //       Get.back();
        //     },
        //     child: Text("Go Online"),
        //   ),
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   snackPosition: SnackPosition.BOTTOM,
        //
        // );
      }
    }
  }

  @override
  RouteSettings? redirect(String? route) {
    return null; // No immediate redirection
  }

  @override
  int? get priority => 1; // High priority
}
