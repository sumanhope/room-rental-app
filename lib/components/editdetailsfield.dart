import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class EditDetailsField extends StatelessWidget {
  const EditDetailsField({
    super.key,
    required this.label,
    required this.controller,
    required this.action,
  });

  final String label;
  final TextEditingController controller;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: AppText.labelText,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          style: AppText.textfieldText,
          textInputAction: action,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFFFF2D6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColor.accentColor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColor.accentColor,
                width: 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
