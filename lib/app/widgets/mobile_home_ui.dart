import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../modules/home/controllers/home_controller.dart';
import 'filter_screen_stack_mobile.dart';
import 'profile_screen_stack_mobile.dart';
import 'user_card.dart';

class MobileHomeUI extends StatelessWidget {
  const MobileHomeUI({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(() {
          return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildUserCard(index, controller));
        }),
        ProfileScreenStackMobile(controller: controller),
        FilterScreenStackMobile(controller: controller),
      ],
    );
  }
}
