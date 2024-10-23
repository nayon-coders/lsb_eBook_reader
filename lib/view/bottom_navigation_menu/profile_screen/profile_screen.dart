import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/auth/controller/auth_controller.dart';
import 'package:ebook_reader/widgets/alert_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../favorite_screen/favorite_screen.dart';
import 'screen/edit_profile.dart';
import 'widget/list_menu.dart';
import 'widget/profile_info_widgets.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final logoutController = Get.put(AuthController());

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
              onPressed: ()=>Get.toNamed(AppRoute.editProfile),
              icon:const Icon(Icons.settings,color: Colors.black,size: 25,),
          ),
         const SizedBox(width: 10,),
        ],
      ),
      body: ListView(
        padding:const EdgeInsets.all(20),
        children: [

          //Profile section
          TopProfileInfoWidget(), // this is the profile view widget
         //to profile view widget


          const SizedBox(height: 20,),

          ListMenu(onClick: ()=>Get.to(()=>EditProfile()), name: "Edit Profile", icon: Icons.edit),
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
          ListMenu(onClick: ()async{
            Get.defaultDialog(
              title: "Confirm Logout",
              middleText: "Are you sure you want to logout?",
              textConfirm: "Yes",
              textCancel: "No",
              confirmTextColor: Colors.white,
              onConfirm: () {
                logoutController.logout();  // Logout function call korchi
              },
              onCancel: () {
                Get.back();  // Popup ta bandho korchi
              },
            );

          }, name: "Logout", icon: Icons.login),


        ],
      )
    );
  }
}

