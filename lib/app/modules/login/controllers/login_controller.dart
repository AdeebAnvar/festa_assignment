import 'package:festa_assignment/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onLogin() {
    Get.offAllNamed(Routes.HOME);
  }
}
