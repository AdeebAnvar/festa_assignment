import 'package:festa_assignment/cores/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customTeal,
      ),
      title: 'Application',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
