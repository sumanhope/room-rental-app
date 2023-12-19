import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    required this.func,
    required this.title,
  });

  final Size size;
  final VoidCallback func;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.6,
      height: size.height * 0.06,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            width: 3,
            color: Color.fromARGB(88, 0, 0, 0),
          ),
        ),
        child: Text(
          title,
          style: AppText.whitenormalbuttonText,
        ),
      ),
    );
  }
}
