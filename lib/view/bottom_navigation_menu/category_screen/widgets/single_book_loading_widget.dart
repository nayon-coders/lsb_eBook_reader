import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';
import '../../../../widgets/app_shimmer_pro.dart';


class SingleBookLoadingWidget extends StatelessWidget {
  const SingleBookLoadingWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height*0.4,
          width: size.width,
          decoration:const BoxDecoration(
            color: AppColors.bottomNev ,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6)),
          ),
          child: AppShimmerPro.circularShimmer(
              width: MediaQuery.of(context).size.width,
              height: 450,
              borderRadius: 0
          ),
        ),
        const SizedBox(height: 10,),
        AppShimmerPro.TextShimmer(width: 200, maxLine: 3),
        const SizedBox(height: 10,),
        AppShimmerPro.TextShimmer(width: double.infinity, maxLine: 15),
        const SizedBox(height: 10,),


      ],
    );
  }
}
