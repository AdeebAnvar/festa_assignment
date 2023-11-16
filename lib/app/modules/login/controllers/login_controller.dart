import 'package:festa_assignment/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void onLogin() {
    Get.offAllNamed(Routes.HOME);
  }
}
