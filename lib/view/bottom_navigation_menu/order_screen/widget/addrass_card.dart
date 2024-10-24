import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';

class AddressCard extends StatelessWidget {
   AddressCard({super.key,
    this.width=double.infinity,
    this.bgColor=Colors.white,
    required this.home,
    required this.addressName, required this.editIcon, required this.deleteIcon});
  final double? width;
  final Color? bgColor;
  final String home;
  final String addressName;
  final Widget editIcon;
  final Widget deleteIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //home
              Text(home,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),

              SizedBox(
                  width: 250,
                  child: Text(addressName,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.textBlack),)),
            ],
          ),
          Row(
            children: [
              editIcon,
              deleteIcon
            ],
          ),
        ],
      ),
    );

  }
}
