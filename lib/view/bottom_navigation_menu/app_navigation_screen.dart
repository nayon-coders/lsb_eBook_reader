import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_navigation_menu/home_screen/home_screen.dart';
import '../bottom_navigation_menu/profile_screen/profile_screen.dart';
import 'books_screen/screen/all_books_screen.dart';
import 'controller/controller.dart';
import 'favorite_screen/favorite_screen.dart';
import 'save_screen/save_screen.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());
    return Scaffold(
      body: Obx((){
        switch (controller.currentIndex.value){
          case 0:
            return HomeScreen();
          case 1:
            return const AllBooksScreen(); //change it to AllBooksScreen();
          case 2:
            return const SaveScreen();
          case 3:
            return  FavoriteScreen();
          case 4:
            return const ProfileScreen();
          default:
            return HomeScreen();

        }
      }),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(

          backgroundColor: AppColors.bottomNev,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.textBlack,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,


          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.bottomNev,
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      controller.currentIndex==0?Colors.white:AppColors.textBlack,
                      BlendMode.srcIn
                  ),
                    child: Image.asset(Assets.home,height: 25,width: 25,fit: BoxFit.contain,)),
                label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.bottomNev,
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      controller.currentIndex==1?Colors.white:AppColors.textBlack,
                      BlendMode.srcIn
                  ),
                    child: Image.asset(Assets.menu,height: 25,width: 25,fit: BoxFit.contain,)),
                label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.bottomNev,
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      controller.currentIndex==2?Colors.white:AppColors.textBlack,
                      BlendMode.srcIn
                  ),
                    child: Image.asset(Assets.save,height: 25,width: 25,fit: BoxFit.contain,)),
                label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.bottomNev,
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      controller.currentIndex==3?Colors.white:AppColors.textBlack,
                      BlendMode.srcIn
                  ),
                    child:const Icon(Icons.favorite_border,size: 30,)),
                label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.bottomNev,
                icon:ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    controller.currentIndex==4?Colors.white:AppColors.textBlack,
                    BlendMode.srcIn,
                  ),

                    child: Image.asset(Assets.profile,height: 25,width: 25,fit: BoxFit.contain,)),
                label: "",

            ),
          ],
        );
      }),
    );
  }
}
