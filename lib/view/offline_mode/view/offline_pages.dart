import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflinePages extends StatefulWidget {
  const OfflinePages({super.key});

  @override
  State<OfflinePages> createState() => _OfflinePagesState();
}

class _OfflinePagesState extends State<OfflinePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[

            Icon(
              Icons.wifi_off,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please check your connection.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "You can still read downloaded books.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                children: [
                  Expanded( 
                    child: AppButton(name: "Reload", onClick: (){
                      Get.toNamed(AppRoute.OfflinePages);
                    }, bgColor: Colors.blue,)
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                      child: AppButton(name: "Read Book", onClick: ()=>Get.toNamed(AppRoute.OfflineMyBook), bgColor: Colors.green,)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
