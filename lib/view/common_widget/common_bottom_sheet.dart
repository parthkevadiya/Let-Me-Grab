import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBottomSheet {
  static openBottomSheet({Widget? child}) {
    return Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
