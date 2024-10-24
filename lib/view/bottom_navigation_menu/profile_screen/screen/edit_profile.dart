
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/coustom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/route_name.dart';
import '../../../../utility/app_assets.dart';
import '../../../../utility/app_color.dart';

class EditProfile extends GetView<ProfileController> {
   EditProfile({super.key});


   final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)),
        title:const Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
        actions: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.save_alt,color: AppColors.buttonGreen,))
        ],
      ),
      body: Obx(() {
          return Form(
            key: _key,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                //profile image
                Center(
                  child: Stack(
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
                          child:IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt,size: 30,)))
                    ],
                  ),
                ),

               const SizedBox(height: 20,),

                AppInput(

                    hint: "Name",
                    textType: TextInputType.name,
                    controller:controller.name.value ),
               const SizedBox(height: 15,),

                AppInput(
                    hint: "Email",

                    textType: TextInputType.emailAddress,
                    controller: controller.email.value
                ),


                const SizedBox(height: 15,),
                AppInput(

                    hint: "Phone",
                    textType: TextInputType.number,
                    controller: controller.phone.value,
                ),
                const SizedBox(height: 15,),
                AppInput(

                    hint: "Address",
                    controller: controller.address.value,
                ),
                const SizedBox(height: 15,),

                //Dropdown
                CustomDropDown(
                    items: controller.items,
                    hint: "Profession",
                    value: controller.selectedItem.value,
                    onChange: (v){}
                ),

                const SizedBox(height: 40,),
                Obx(() {
                    return AppButton(
                      isLoading: controller.isLoading.value,
                        name: "Save",
                        onClick: (){
                          controller.updateUserInfo();

                        },
                    );
                  }
                )


              ],
            ),
          );
        }
      ),

    );
  }
}
