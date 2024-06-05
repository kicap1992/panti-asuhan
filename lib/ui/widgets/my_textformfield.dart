import 'package:flutter/material.dart';

import '../../app/themes/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.controller,
    this.maxLines = 1,
    this.onEditingComplete,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.enabled = true,
    this.maxLength,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int maxLines;
  final VoidCallback? onEditingComplete;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final String? initialValue;
  final bool enabled;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      enabled: enabled,
      initialValue: initialValue,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: dangerColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: dangerColor,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: fontColor),
      ),
      validator: validator,
    );
  }
}
