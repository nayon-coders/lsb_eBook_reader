import 'package:ebook_reader/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_button.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80,),
            SizedBox(height: 10,),
            Text("Order Placed Successfully", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: 20,),
            AppButton(
              name: "Back to Home",
              onClick: (){
                Get.offAllNamed(AppRoute.appNavigation);
              },
            )
          ],
        ),
      ),
    );
  }
}
