import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.size,
    required this.func,
    required this.leading,
    required this.title,
  });

  final Size size;
  final VoidCallback func;
  final IconData leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 8,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.07,
        child: TextButton(
          onPressed: func,
          style: TextButton.styleFrom(
            backgroundColor: AppColor.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Icon(
                leading,
                size: 27,
                color: Colors.white,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.whitenormalbuttonText,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
