import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../modules/home/controllers/home_controller.dart';
import 'user_card.dart';

class WebHomeUI extends StatelessWidget {
  const WebHomeUI({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.teal[700],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 4,
          child: Obx(() {
            if (controller.userData.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          controller.userData[0].picture!.large.toString()),
                    ),
                    SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('data'),
              );
            }
          }),
        ),
        Expanded(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => controller.onClickFilter(context),
                      child: const Text('Filter')),
                  const SizedBox(width: 20)
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Obx(() {
                  if (MediaQuery.of(context).size.width <= 1232) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            buildUserCard(index, controller));
                  } else {
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.0,
                          mainAxisSpacing: 60.0,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            buildUserCard(index, controller));
                  }
                }),
                Align(
                  alignment: Alignment.topRight,
                  child: Obx(() {
                    return Visibility(
                      visible: controller.isFilterCardOpen.value,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Gender',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  children: <Widget>[
                                    Obx(
                                      () => Radio(
                                        value: 'male',
                                        groupValue:
                                            controller.selectedGender.value,
                                        onChanged: (String? value) => controller
                                            .handleGenderChange(value!),
                                      ),
                                    ),
                                    const Text('Male'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Obx(
                                      () => Radio(
                                        value: 'female',
                                        groupValue:
                                            controller.selectedGender.value,
                                        onChanged: (String? value) => controller
                                            .handleGenderChange(value!),
                                      ),
                                    ),
                                    const Text('Female'),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () =>
                                          controller.filterGender(context),
                                      child: const Text('Filter'),
                                    ),
                                    OutlinedButton(
                                      onPressed: controller.clearSelection,
                                      child: const Text('Clear'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ))
          ],
        ))
      ],
    );
  }
}
