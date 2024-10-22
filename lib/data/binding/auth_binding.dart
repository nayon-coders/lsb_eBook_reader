import 'package:get/get.dart';
//AuthController binging get
import 'package:ebook_reader/view/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}