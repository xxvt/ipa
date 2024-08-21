import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackBar(String title, String message) {
  Get.showSnackbar(GetBar(
    title: title,
    message: message,
    icon: Icon(Icons.check_circle, color: Colors.green),
    shouldIconPulse: true,
    duration: Duration(seconds: 3),
    isDismissible: true,
    backgroundColor: Colors.greenAccent,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    messageText: Text(message, style: TextStyle(color: Colors.white)),
  ));
}

void showErrorSnackBar(String title, String message) {
  Get.showSnackbar(GetBar(
    title: title,
    message: message,
    icon: Icon(Icons.error, color: Colors.red),
    shouldIconPulse: true,
    duration: Duration(seconds: 3),
    isDismissible: true,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    messageText: Text(message, style: TextStyle(color: Colors.white)),
  ));
}
