import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key,
    this.width=double.infinity,
    this.bgColor=Colors.white,
    required this.home,
    required this.addressName});
  final double? width;
  final Color? bgColor;
  final String home;
  final String addressName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(home,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
          SizedBox(
              width: 300,
              child: Text(addressName,
                style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.textBlack),)),
        ],
      ),
    );
  }
}
