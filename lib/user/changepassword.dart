import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/editdetailsfield.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/forgotpassword.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final oldpasswordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Change Password",
          arrow: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Text(
                    "Your password must be at least six characters and should include a combination of numbers, letters and special characters.",
                    style: AppText.blacksmallText,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: EditDetailsField(
                    label: "Old Password",
                    controller: oldpasswordController,
                    action: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: EditDetailsField(
                    label: "New Password",
                    controller: newpasswordController,
                    action: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 8,
                    bottom: 2,
                  ),
                  child: EditDetailsField(
                    label: "Confirm Password",
                    controller: confirmpasswordController,
                    action: TextInputAction.done,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    child: const Text(
                      'Forgot Password?',
                      style: AppText.labelText,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ForgotPasswordPage();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: CustomButton(
                      size: size,
                      func: () {},
                      title: "Confirm",
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
