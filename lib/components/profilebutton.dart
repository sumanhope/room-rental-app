import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';

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
            backgroundColor: AppColor.accentColor,
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
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
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
