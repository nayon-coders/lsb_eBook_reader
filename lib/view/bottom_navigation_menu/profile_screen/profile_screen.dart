import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/auth/controller/auth_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/controller/navigation_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/screen/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../favorite_screen/favorite_screen.dart';
import 'screen/edit_profile.dart';
import 'widget/list_menu.dart';
import 'widget/profile_info_widgets.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final logoutController = Get.put(AuthController());
  final profileController = Get.find<ProfileController>();

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

         //  ListMenu(onClick: ()=>Get.toNamed(AppRoute.editProfile), name: "Edit Profile", icon: Icons.edit),
         // const SizedBox(height: 10,),

          ListMenu(onClick: ()=>Get.to(()=>FavoriteScreen()), name: "Favorite", icon: Icons.favorite),
          ListMenu(onClick: (){
            Get.toNamed(AppRoute.myOrderScreen);
          }, name: "Downloads (My books)", icon: Icons.cloud_download),
         const Divider(),
          ListMenu(onClick: ()=>Get.toNamed(AppRoute.aboutUs), name: "About us", icon: Icons.clear_all_rounded),
          ListMenu(onClick: ()=>Get.toNamed(AppRoute.contactUs), name: "Contact us", icon: Icons.contact_support),
          ListMenu(onClick: ()=>Get.toNamed(AppRoute.privacyPolicy), name: "Privacy Policy", icon: Icons.privacy_tip),
          ListMenu(onClick: ()=>Get.toNamed(AppRoute.returnPolicy), name: "Refund Policy", icon: Icons.recycling),
          ListMenu(onClick: ()=>Get.toNamed(AppRoute.termsCondition), name: "Terms & Condition", icon: Icons.sticky_note_2_outlined),


         const Divider(),
          ListMenu(onClick: (){
            launchUrl(Uri.parse("https://www.facebook.com/ahmedsenglish.official"));
          }, name: "Join now", icon: Icons.facebook),
          ListMenu(onClick: (){
            launchUrl(Uri.parse("https://www.youtube.com/@ahmed.english"));
          }, name: "Subscribe Now", icon: Icons.subscriptions_sharp),
         const Divider(),

          ListMenu(onClick: (){
            Get.defaultDialog(
              title: "Confirm Delete Account",
              middleText: "Are you sure you want to delete account?",
              textConfirm: "Yes",
              textCancel: "No",
              confirmTextColor: Colors.white,
              onConfirm: () {
               profileController.deleteUser();
              },
              onCancel: () {
                Get.back();
              },

            );
          }, name: "Delete Account", icon: Icons.delete),
          ListMenu(onClick: ()async{
            Get.defaultDialog(
              title: "Confirm Logout",
              middleText: "Are you sure you want to logout?",
              textConfirm: "Yes",
              textCancel: "No",
              confirmTextColor: Colors.white,
              onConfirm: () {
                logoutController.logout();
              },
              onCancel: () {
                Get.back();
              },
            );

          }, name: "Logout", icon: Icons.login),


        ],
      )
    );
  }
}

