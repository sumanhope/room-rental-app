import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:roomrentalapp/components/customoutlinebutton.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class ResetVerificationPage extends StatelessWidget {
  const ResetVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      color: AppColor.primaryColor,
                      height: size.height * 0.26,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: MovieTicketClipper(),
                  child: Container(
                    color: AppColor.primaryColor,
                    height: size.height * 0.24,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.email_outlined,
              color: AppColor.accentColor,
              size: 150,
            ),
            const Text(
              "Check Your Mail",
              style: AppText.orangeXLText,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "We have send a password recovery link on your email.",
                textAlign: TextAlign.center,
                style: AppText.blacknormalText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    width: 2,
                    color: AppColor.accentColor,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Resend",
                  style: AppText.whitenormalbuttonText,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: CustomOutlineButton(
                func: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Didn't receive email? Check spam filter or try another email! ",
                style: AppText.blacksmallText,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
