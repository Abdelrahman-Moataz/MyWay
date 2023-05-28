

import 'package:get/get.dart';

import '../../../loginpages/auth_controler.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}