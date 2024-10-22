import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';
class MenuCard extends StatelessWidget {
   MenuCard({super.key,required this.name,required this.image,required this.onClick});
  String name;
  String image;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.menuColor
        ),
        child: Column(
          children: [
            Image.asset(image,height: 70,width: 70,fit: BoxFit.cover,),
             Text(name,style:const TextStyle(fontWeight: FontWeight.w600,fontSize:13,color: AppColors.textBlack),)
          ],
        ),
      ),
    );
  }
}
