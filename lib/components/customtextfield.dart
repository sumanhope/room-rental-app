import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.leading,
    required this.title,
    required this.type,
    required this.action,
  });

  final TextEditingController controller;
  final IconData leading;
  final String title;
  final TextInputType type;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFF2D6),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
        labelText: title,
        labelStyle: AppText.labelText,
        prefixIcon: Icon(
          leading,
          color: AppColor.primaryColor,
          size: 30,
        ),
        suffixIcon: controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.primaryColor,
                ),
                onPressed: () => controller.clear(),
              ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
      ),
      style: AppText.textfieldText,
      keyboardType: type,
      textInputAction: action,
      cursorColor: AppColor.accentColor,
    );
  }
}
