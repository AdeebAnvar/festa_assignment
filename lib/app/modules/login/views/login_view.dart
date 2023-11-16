import '../../../widgets/custom_textfield.dart';
import '../../../../cores/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/mobile_login_ui.dart';
import '../../../widgets/web_login_ui.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 100, 89),
      body: isMobile(context)
          ? MobilLoginUI(
              onLoginPressed: () => controller.onLogin(),
            )
          : WebLoginUI(
              onLoginPressed: () => controller.onLogin(),
            ),
    );
  }
}
