import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/login.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.22,
        decoration: BoxDecoration(
          color: AppColor.extraColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0xCE8D0000),
              blurRadius: 3,
              offset: Offset(1, 5), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
              child: Text(
                "Log in to add room, check room details, as well as to access favorites.",
                textAlign: TextAlign.center,
                style: AppText.blacksmallText,
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: AppText.whitenormalbuttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
