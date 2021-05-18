import 'package:custom_text_form_field/custom_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'controller/controller.dart';

class CustomTextFormFieldExample extends StatefulWidget {
  const CustomTextFormFieldExample({Key key}) : super(key: key);

  @override
  _CustomTextFormFieldExampleState createState() =>
      _CustomTextFormFieldExampleState();
}

class _CustomTextFormFieldExampleState
    extends State<CustomTextFormFieldExample> {
  Controller _controller;

  @override
  void initState() {
    _controller = Get.put(Controller());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              heading: 'Email',
              hint: 'Enter Email',
              textInputType: TextInputType.emailAddress,
              controller: _controller.textEditingEmailController,
              errorMsg: _controller.emailError,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              heading: 'Phone Number',
              hint: 'Enter Phone Number',
              textInputType: TextInputType.phone,
              controller: _controller.textEditingPhoneController,
              textInputFormatter:
                  MaskTextInputFormatter(mask: "(###) ###-##-##"),
              errorMsg: _controller.phoneError,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              heading: 'Email/Phone',
              hint: 'Enter Email or Phone Number',
              controller: _controller.textEditingEmailPhoneController,
              errorMsg: _controller.phoneError,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              heading: 'User Name',
              hint: 'Enter UserName',
              textInputType: TextInputType.name,
              controller: _controller.textEditingUserNameController,
              errorMsg: _controller.userNameError,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              heading: 'Password',
              hint: 'Enter Password',
              textInputType: TextInputType.visiblePassword,
              maxLength: 8,
              controller: _controller.textEditingPasswordController,
              errorMsg: _controller.passwordError,
              isPasswordField: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              heading: 'Disabled Field',
              hint: 'Disabled view',
              isEnabled: false,
              suffixWidget: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.validateForm();
                setState(() {});
              },
              child: Text('Validate Now'),
            )
          ],
        )),
      ),
    );
  }
}
