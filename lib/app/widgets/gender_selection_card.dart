import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../modules/home/controllers/home_controller.dart';

class GenderSelectionCard extends StatelessWidget {
  const GenderSelectionCard({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: <Widget>[
                Obx(
                  () => Radio(
                    value: 'male',
                    groupValue: controller.selectedGender.value,
                    onChanged: (String? value) =>
                        controller.handleGenderChange(value!),
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
                    groupValue: controller.selectedGender.value,
                    onChanged: (String? value) =>
                        controller.handleGenderChange(value!),
                  ),
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => controller.filterGender(context),
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
    );
  }
}
