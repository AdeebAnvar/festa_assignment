import 'package:flutter/material.dart';

import '../modules/home/controllers/home_controller.dart';
import 'gender_selection_card.dart';

class FilterScreenStackMobile extends StatelessWidget {
  const FilterScreenStackMobile({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.filterAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(controller.filterAnimation.value, 0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal[700],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: GenderSelectionCard(controller: controller),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
