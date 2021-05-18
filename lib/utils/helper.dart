import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Flushbar showFloatingAlert(String msg,
    {Color bgColor = Colors.greenAccent,
    IconData icon = Icons.info_outline,
    Color iconColor = Colors.redAccent}) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    padding: EdgeInsets.all(20),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    backgroundColor: bgColor,
    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
    message: msg,
    duration: Duration(seconds: 2),
    mainButton: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(icon, color: iconColor),
      ),
    ),
  )..show(Get.context);
}
