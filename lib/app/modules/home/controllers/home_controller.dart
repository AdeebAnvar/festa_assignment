import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repository/data_repository.dart';
import '../../../data/repository/filter_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../routes/app_pages.dart';
import '../views/home_view.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin, StateMixin<HomeView> {
  RxList<UserApiResults> userData = <UserApiResults>[].obs;
  RxList<UserApiResults> data = <UserApiResults>[].obs;
  late AnimationController profileAnimationController;
  late AnimationController filterAnimationController;
  RxBool isFilterCardOpen = false.obs;
  late Animation<double> filterAnimation;
  late Animation<double> profileAnimation;
  RxString selectedGender = ''.obs;

  @override
  void onInit() {
    super.onInit();
    profileAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    filterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    profileAnimation =
        Tween<double>(begin: -500, end: 0).animate(profileAnimationController);
    filterAnimation =
        Tween<double>(begin: 600, end: 0).animate(filterAnimationController);

    loadData();
  }

  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    await fetchUserData()
        .then((List<UserApiResults> value) => userData.value = value);
    await fetchData().then((List<UserApiResults> value) => data.value = value);
    change(null, status: RxStatus.success());
  }

  Future<List<UserApiResults>> fetchUserData() async {
    try {
      final List<UserApiResults> response =
          await UserRepository().fetchUserData();
      return response;
    } catch (e) {
      log(e.toString());
      return <UserApiResults>[];
    }
  }

  Future<List<UserApiResults>> fetchData() async {
    try {
      final List<UserApiResults> response = await DataRepositoy().fetchData();
      return response;
    } catch (e) {
      log(e.toString());
      return <UserApiResults>[];
    }
  }

  void onLogout() => Get.offAllNamed(Routes.LOGIN);

  void handleGenderChange(String value) {
    selectedGender.value = value;
  }

  void clearSelection() {
    selectedGender.value = '';
  }

  Future<void> filterGender(BuildContext context) async {
    try {
      data.clear();
      loadingDialogue(context);
      final List<UserApiResults> response =
          await FilterRepository().filterByGender(selectedGender.value);
      if (response.isNotEmpty) {
        data.value = response;
      } else {
        data.value = [];
      }
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
      if (filterAnimation.isCompleted) {
        filterAnimationController.reverse();
      }
    }
  }

  Future<dynamic> loadingDialogue(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha(180),
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.teal[800]!,
                size: 70,
              ),
              const Text('Filtering',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        );
      },
    );
  }

  void onClickFilter(BuildContext context) {
    if (isFilterCardOpen.value) {
      isFilterCardOpen.value = false;
    } else {
      isFilterCardOpen.value = true;
    }
  }

  @override
  void onClose() {
    profileAnimationController.dispose();
    super.onClose();
  }
}
