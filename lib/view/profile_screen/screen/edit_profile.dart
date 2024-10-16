
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/coustom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_color.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final List items =["student","teacher","banker"];


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
      body: ListView(
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
              controller:_name ),
         const SizedBox(height: 15,),

          AppInput(
              hint: "Email",
              textType: TextInputType.emailAddress,
              controller:_email
          ),


          const SizedBox(height: 15,),
          AppInput(
              hint: "Phone",
              textType: TextInputType.number,
              controller:_phone,
          ),
          const SizedBox(height: 15,),
          AppInput(
              hint: "Address",
              controller:_address
          ),
          const SizedBox(height: 15,),

          //Dropdown
          CustomDropDown(items: items, hint: "Profession", onChange: (v){})


        ],
      ),

    );
  }
}
