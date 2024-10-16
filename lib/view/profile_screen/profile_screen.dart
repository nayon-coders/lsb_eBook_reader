import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/profile_screen/screen/edit_profile.dart';
import 'package:ebook_reader/view/profile_screen/screen/favorite_screen.dart';
import 'package:ebook_reader/view/profile_screen/widget/list_menu.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/bg_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        title:const Text("My Account",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:AppColors.textBlack),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:const Icon(Icons.settings,color: Colors.black,size: 25,),
          ),
         const SizedBox(width: 10,),
        ],
      ),
      body: ListView(
        padding:const EdgeInsets.all(20),
        children: [

          //Profile section
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Image.asset(Assets.logo,height: 50,width: 50,fit: BoxFit.cover,),
                  ),
                  Positioned(
                      bottom: 0,
                      right: -10,
                      child: IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt,size: 30,)))
                ],
              ),
             const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //name
                  Text("Name",style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.textBlack,
                  ),
                  ),

                  //Email
                  Text("nayon.coders@gmail.com",style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.textBlack,
                  ),),
                 const SizedBox(height: 5,),

                  AppButton(
                    height: 40,
                    width: 200,
                      name: "Edit Profile", onClick: ()=>Get.to(()=>EditProfile())),

                ],
              )

            ],
          ),
         const SizedBox(height: 20,),

          ListMenu(onClick: ()=>Get.to(()=>FavoriteScreen()), name: "Favorite", icon: Icons.favorite),
          ListMenu(onClick: (){}, name: "Downloads (My books)", icon: Icons.cloud_download),
         const Divider(),
          ListMenu(onClick: (){}, name: "About us", icon: Icons.clear_all_rounded),
          ListMenu(onClick: (){}, name: "Contact us", icon: Icons.contact_support),
          ListMenu(onClick: (){}, name: "Privacy Policy", icon: Icons.privacy_tip),

         const Divider(),
          ListMenu(onClick: (){}, name: "Join now", icon: Icons.facebook),
          ListMenu(onClick: (){}, name: "Subscribe Now", icon: Icons.subscriptions_sharp),
         const Divider(),

          ListMenu(onClick: (){}, name: "Delete Account", icon: Icons.delete),
          ListMenu(onClick: ()=>Get.offAllNamed(RouteName.login), name: "Logout", icon: Icons.login),


        ],
      )
    );
  }
}
