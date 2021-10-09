import 'staticVariables.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  TextEditingController controller;
  FormFieldValidator<String> validator;
  ValueChanged<String> onFieldSubmitted;
  TextInputAction textInputAction;
  Widget prefixIcon;
  TextInputType textInputType;
  bool obscureText;
  FocusNode focusNode;

  AppTextField({
    @required this.controller,
    @required this.validator,
    this.onFieldSubmitted,
    this.textInputAction ,
    this.prefixIcon,
    this.textInputType,
    this.obscureText = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,

      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType ??TextInputType.name,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 5),
        prefixIcon: prefixIcon,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: staticVars.borderRadius,
          borderSide: BorderSide()
        ),
      ),
    );
  }
}
