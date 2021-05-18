import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String heading;
  final String hint;
  String errorMsg = "";
  final TextEditingController controller;
  final int maxLength;
  final TextInputType textInputType;
  TextInputFormatter textInputFormatter;
  bool isPasswordField;
  bool disableFieldValidation;
  bool isEnabled;
  Widget suffixWidget;
  Function onSuffixIconClick;

  CustomTextFormField(
      {this.heading = '',
      this.hint,
      this.errorMsg,
      this.controller,
      this.maxLength,
      this.textInputType,
      this.textInputFormatter,
      this.isPasswordField = false,
      this.disableFieldValidation = false,
      this.isEnabled = true,
      this.suffixWidget,
      this.onSuffixIconClick});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  ValueNotifier<String> text = ValueNotifier('');
  bool isPasswordVisible = false;
  TextInputFormatter _formatter;

  @override
  void initState() {
    super.initState();
    isPasswordVisible = widget.isPasswordField;
    _formatter = widget.textInputFormatter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: text,
          builder: (BuildContext context, String textValue, Widget child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    widget.heading,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.orange,
                  enabled: widget.isEnabled,
                  maxLength: widget.maxLength,
                  obscureText: isPasswordVisible,
                  keyboardType: widget.textInputType,
                  controller: widget.controller,
                  style: TextStyle(color: Colors.black),
                  inputFormatters: _formatter != null ? [_formatter] : [],
                  decoration: InputDecoration(
                    errorText:
                        (widget.errorMsg == null && textValue.length == 0 ||
                                widget.disableFieldValidation)
                            ? null
                            : widget.errorMsg,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 15, 20),
                    hintText: widget.hint,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor:
                        widget.isEnabled ? Colors.grey[400] : Colors.yellow,
                    filled: true,
                    counterText: "",
                    suffixIconConstraints: BoxConstraints(),
                    suffixIcon: (widget.isPasswordField != null &&
                            widget.isPasswordField &&
                            widget.isEnabled)
                        ? _managePasswordVisibility(isPasswordVisible)
                        : widget.suffixWidget != null
                            ? _manageSuffixWidget()
                            : null,
                    disabledBorder: _getBorderStyle(Colors.transparent),
                    focusedBorder: _getBorderStyle(Colors.orange),
                    focusedErrorBorder: _getBorderStyle(Colors.red),
                    enabledBorder: _getBorderStyle(Colors.transparent),
                    errorBorder: _getBorderStyle(Colors.red),
                    border: _getBorderStyle(Colors.orange),
                    errorMaxLines: 1,
                  ),
                  onChanged: (value) {
                    widget.errorMsg = null;
                    text.value = value;
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  UnderlineInputBorder _getBorderStyle(Color color) => UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: color, width: 8));

  GestureDetector _managePasswordVisibility(bool value) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: Text(
          value ? 'Show' : 'Hide',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      onTap: () => {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        })
      },
    );
  }

  GestureDetector _manageSuffixWidget() {
    return GestureDetector(
      child: widget.suffixWidget,
      onTap: () => {
        if (widget.isEnabled) widget.onSuffixIconClick
      },
    );
  }
}
