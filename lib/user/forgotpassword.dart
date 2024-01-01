import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/components/errordialog.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/verification/resetverification.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: emailController.text.trim(),
      )
          .then(
        (value) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const ResetVerificationPage();
              },
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      errorDialog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        // appBar: const CustomAppBar(
        //   title: "Forgot Password",
        //   arrow: true,
        // ),
        body: SingleChildScrollView(
          child: Center(
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
                          height: size.height * 0.20,
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MovieTicketClipper(),
                      child: Container(
                        color: AppColor.primaryColor,
                        height: size.height * 0.18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 4),
                    child: Text(
                      "Reset Password",
                      style: AppText.orangeXLText,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      width: size.width,
                      child: const Text(
                        "Enter the email associated with your account "
                        "and we'll send an email with instruction to reset "
                        "your password.",
                        style: AppText.blacksmallText,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 15,
                    left: 10,
                    right: 10,
                  ),
                  child: CustomTextField(
                    controller: emailController,
                    leading: Icons.email_outlined,
                    title: "Email Address",
                    type: TextInputType.emailAddress,
                    action: TextInputAction.done,
                  ),
                ),
                CustomButton(
                  size: size,
                  func: () {
                    if (emailController.text.trim().isEmpty) {
                      errorDialog("Please fill the email address", context);
                    } else {
                      passwordReset();
                    }
                  },
                  title: "Confirm",
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: size.width * 0.2,
                  height: size.height * 0.05,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Back",
                      style: AppText.blacknormalText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
