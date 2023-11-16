import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../modules/home/controllers/home_controller.dart';

class ProfileScreenStackMobile extends StatelessWidget {
  const ProfileScreenStackMobile({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.profileAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(controller.profileAnimation.value, 0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal[700],
                child: Obx(() {
                  if (controller.userData.isNotEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 10, color: Colors.white)),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(controller
                                    .userData[0].picture!.medium
                                    .toString()),
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  const SizedBox(height: 60),
                                  Text(
                                    '${controller.userData[0].name?.title} ${controller.userData[0].name?.first} ${controller.userData[0].name?.last}',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'email : ${controller.userData[0].email}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'phone : ${controller.userData[0].phone}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                              onPressed: () => controller.onLogout(),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('data'),
                    );
                  }
                })),
          );
        });
  }
}
