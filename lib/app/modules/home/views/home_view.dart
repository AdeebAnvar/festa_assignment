import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../cores/constants.dart';
import '../../../widgets/mobile_home_ui.dart';
import '../../../widgets/web_home_ui.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: isMobile(context)
            ? AppBar(
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      if (controller.profileAnimationController.status ==
                          AnimationStatus.completed) {
                        controller.profileAnimationController.reverse();
                      }
                      if (controller.filterAnimationController.status ==
                          AnimationStatus.completed) {
                        controller.filterAnimationController.reverse();
                      } else {
                        controller.filterAnimationController.forward();
                      }
                    },
                    child: const Text(
                      'FILTER',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    if (controller.filterAnimationController.status ==
                        AnimationStatus.completed) {
                      controller.filterAnimationController.reverse();
                    }
                    if (controller.profileAnimationController.status ==
                        AnimationStatus.completed) {
                      controller.profileAnimationController.reverse();
                    } else {
                      controller.profileAnimationController.forward();
                    }
                  },
                  icon: const Icon(Icons.dashboard),
                ),
              )
            : null,
        body: controller.obx(
          onLoading: Center(
            child: CircularProgressIndicator(
              color: Colors.teal[800],
            ),
          ),
          (HomeView? state) => isMobile(context)
              ? MobileHomeUI(controller: controller)
              : WebHomeUI(controller: controller),
        ),
      ),
    );
  }
}
