import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';
class OrderRiceText extends StatelessWidget {
  const OrderRiceText({super.key, required this.name, required this.price});
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: AppColors.textBlack),),
        Text("${price!}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlack),),
      ],
    );
  }
}
