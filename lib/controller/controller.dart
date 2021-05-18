import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  String emailError;
  String userNameError;
  String passwordError;
  String phoneError;

  var textEditingEmailController = TextEditingController();
  var textEditingUserNameController = TextEditingController();
  var textEditingPhoneController = TextEditingController();
  var textEditingEmailPhoneController = TextEditingController();
  var textEditingPasswordController = TextEditingController();

  validateForm() {
    emailError = _validateEmail(textEditingEmailController.text);
    userNameError = _validateNewUserName(textEditingUserNameController.text);
    passwordError = _validatePassword(textEditingPasswordController.text);
    phoneError = _validatePhone(textEditingPhoneController.text);
  }

  String _validateEmail(String value) {
    var err;
    if (value.isEmpty) {
      err = 'Please provide email';
    } else if (!GetUtils.isEmail(value)) {
      err = 'Invalid email';
    } else
      err = null;
    return err;
  }

  String _validateNewUserName(String value) {
    return value.isEmpty ? 'Please provide new username' : null;
  }

  String _validatePhone(String value) {
    var err;
    if (value.isEmpty) {
      err = 'Please provide your phone number';
    } else
      err = null;
    return err;
  }

  String _validatePassword(String value) {
    return value.isEmpty ? 'Please provide a password' : null;
  }
}
