import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/customoutlinebutton.dart';
import 'package:roomrentalapp/main.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const LandingPage()
      : KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateAnyDirection
          ],
          child: Scaffold(
            appBar: const CustomAppBar(
              arrow: false,
              title: "",
            ),
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
                            height: 110,
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: MovieTicketClipper(),
                        child: Container(
                          color: AppColor.primaryColor,
                          height: 100,
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
                      "We have send a verification link on your email.",
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
                      onPressed: canResendEmail ? sendVerificationEmail : null,
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
                        FirebaseAuth.instance.signOut().then(
                          (value) {
                            Navigator.pop(context);
                          },
                        );
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
          ),
        );
}
