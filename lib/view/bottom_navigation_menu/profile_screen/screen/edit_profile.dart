
import 'package:ebook_reader/controller/global_controller.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/coustom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utility/app_assets.dart';
import '../../../../utility/app_color.dart';
import '../../../../widgets/app_network_images.dart';
import '../controller/profile_controller.dart';

class EditProfile extends GetView<ProfileController> {
   EditProfile({super.key});


   final GlobalController globalController = Get.put(GlobalController());


   final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)),
        title:const Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),

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
                        child: Obx(() {
                          if(controller.selectedProfilePic.value.path.isNotEmpty){
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                                child: Image.file(controller.selectedProfilePic.value,height: 50,width: 50,fit: BoxFit.cover,));
                          }else if(controller.myProfileModel.value.profilePic!.isNotEmpty){
                            return Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: AppNetworkImage(
                                  src: controller.myProfileModel.value.profilePic!,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }else{
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(Assets.logo,height: 50,width: 50,fit: BoxFit.cover,));
                          }
                          }
                        ),
                      ),
                       Positioned(
                          bottom: 0,
                          right: -10,
                          child:Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white,width: 2)
                              ),child: IconButton(onPressed: ()=>  _buildUploadProfilePicChooseOption(context), icon:Icon(Icons.camera_alt,size: 20, color: AppColors.linkColor,))))
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

  _buildUploadProfilePicChooseOption(context){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Choose Option"),
                SizedBox(height: 20,),
                ListTile(
                  leading: new Icon(Icons.camera_alt),
                  title: new Text('Camera'),
                  onTap: () async{
                   controller.selectedProfilePic.value = await globalController.pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
               ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text('Photo'),
                 onTap: () async{
                   controller.selectedProfilePic.value = await globalController.pickImage(ImageSource.gallery);
                   Navigator.pop(context);
                 },
                ),

              ],
            ),
          );
        });
  }
}
