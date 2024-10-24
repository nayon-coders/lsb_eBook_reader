import 'package:ebook_reader/utility/app_assets.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.empty,height: 150,width: 150,fit: BoxFit.cover,),
        const Text("Data Not Found !",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),
      ],
    );


  }
}
