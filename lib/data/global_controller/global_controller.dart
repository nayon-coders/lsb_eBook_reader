import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/my_profile_model.dart';

class GlobalVariables{
  //static instance
  static Rx<MyProfileModel> gMyProfileModel = MyProfileModel().obs;

}