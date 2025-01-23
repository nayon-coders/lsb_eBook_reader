import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller/navigation_controller.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key,});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  final controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async {
        return  showCustomPopup(context);
      },
      child: Scaffold(

        body:  Obx((){
          return controller.pages[controller.currentIndex.value];
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
                  icon: Obx(() {
                      return ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            controller.currentIndex==0?Colors.white:AppColors.textBlack,
                            BlendMode.srcIn
                        ),
                          child: Image.asset(Assets.home,height: 25,width: 25,fit: BoxFit.contain,));
                    }
                  ),
                  label: "",
              ),
              // BottomNavigationBarItem(
              //   backgroundColor: AppColors.bottomNev,
              //     icon: ColorFiltered(
              //       colorFilter: ColorFilter.mode(
              //           controller.currentIndex==1?Colors.white:AppColors.textBlack,
              //           BlendMode.srcIn
              //       ),
              //         child: Image.asset(Assets.menu,height: 25,width: 25,fit: BoxFit.contain,)),
              //     label: "",
              // ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNev,
                icon: Builder(
                  builder: (context) {
                    return ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            controller.currentIndex==1?Colors.white:AppColors.textBlack,
                            BlendMode.srcIn
                        ),
                        child:const Icon(Icons.menu_book,size: 30,));
                  }
                ),
                  label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNev,
                  icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex==2?Colors.white:AppColors.textBlack,
                        BlendMode.srcIn
                    ),
                      child:const Icon(Icons.favorite_border,size: 30,)),
                  label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNev,
                icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex==3?Colors.white:AppColors.textBlack,
                        BlendMode.srcIn
                    ),
                    child:const Icon(Icons.person,size: 30,)),
                  label: "",

              ),
            ],
          );
        }),
      ),
    );
  }


   showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit App'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Do you want to exit from this app?'),
              SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   onPressed: () {
                     SystemNavigator.pop();
                   },
                   child: Text('YES'),
                 ),
                 ElevatedButton(
                   style: ButtonStyle(
                     backgroundColor: WidgetStateProperty.all(Colors.red)
                   ),
                   onPressed: () {
                     Navigator.of(context).pop(); // Close the popup
                   },
                   child: Text('NO',
                    style: TextStyle(
                      color: Colors.white
                    ),
                   ),
                 ),
               ],
             )
            ],
          ),
        );
      },
    );
  }
}
