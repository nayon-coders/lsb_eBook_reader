import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utility/app_assets.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../screen/edit_profile.dart';
class TopProfileInfoWidget extends GetView<ProfileController> {
  const TopProfileInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Obx(() {
              if(controller.isLoading.value){
                return AppShimmerPro.circularShimmer(height: 110,width: 110, borderRadius: 100);
              }else{
                if(controller.myProfileModel.value!.profilePic!.isNotEmpty){
                  return Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: NetworkImage("${AppConfig.DOMAIN}${controller.myProfileModel.value!.profilePic}"),
                            fit: BoxFit.cover
                        )
                    ),
                  );
                }
                return Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Image.asset(Assets.logo,height: 50,width: 50,fit: BoxFit.cover,),
                );
              }
              }
            ),
            Positioned(
                bottom: 0,
                right: -10,
                child: IconButton(onPressed: ()=>Get.toNamed(AppRoute.editProfile), icon:const Icon(Icons.camera_alt,size: 30,)))
          ],
        ),
        const SizedBox(width: 10,),
        Obx(() {
          if(controller.isLoading.value){
            return AppShimmerPro.TextShimmer(width: 150, maxLine: 3);
          }else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //name
                Text("${controller.myProfileModel.value!.name!}",style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.textBlack,
                ),),

                //Email
                Text("${controller.myProfileModel.value.email}",style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.textBlack,
                ),),
                const SizedBox(height: 5,),

                AppButton(
                    height: 40,
                    width: 200,
                    name: "Edit Profile", onClick: ()=>Get.toNamed(AppRoute.editProfile)),

              ],
            );
          }


          }
        )

      ],
    );
  }
}
