import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/backend/backend.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/forgotpassword.dart';
import 'package:roomrentalapp/user/register.dart';
import 'package:roomrentalapp/verification/emailverification.dart';
//import 'package:roomrentalapp/verification/emailverification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Future errorDialog(String error) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          backgroundColor: const Color.fromARGB(148, 255, 2, 2),
          elevation: 5,
          title: Center(
            child: Text(
              error,
              style: const TextStyle(
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return TextField(
      onChanged: (value) => setState(() => password = value),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFF2D6),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColor.accentColor,
            width: 3,
          ),
        ),
        labelText: 'Password',
        labelStyle: AppText.labelText,
        prefixIcon: const Icon(
          Icons.key,
          color: AppColor.primaryColor,
          size: 30,
        ),
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () =>
              setState(() => isPasswordVisible = !isPasswordVisible),
          color: AppColor.primaryColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
      ),
      obscureText: isPasswordVisible,
      style: AppText.textfieldText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      cursorColor: AppColor.accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColor.primaryColor,
        //   automaticallyImplyLeading: false,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        color: AppColor.primaryColor,
                        height: size.height * 0.26,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      color: AppColor.primaryColor,
                      height: size.height * 0.24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome Back",
                style: AppText.orangeXLText,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: CustomTextField(
                        controller: usernameController,
                        leading: Icons.person,
                        title: "Username",
                        action: TextInputAction.next,
                        type: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: passwordField(),
                    ),
                    Container(
                      alignment: Alignment.topRight,
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
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      size: size,
                      func: () async {
                        if (usernameController.text.trim().isNotEmpty &&
                            password.isNotEmpty) {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.accentColor,
                                ),
                              );
                            },
                          );
                          String result =
                              await login(usernameController.text, password);
                          if (result == "true") {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const EmailVerificationPage();
                                },
                              ),
                            );
                          } else {
                            errorDialog(result);
                          }
                        }
                      },
                      title: "LOG IN",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have a account?',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Click Here',
                            style: TextStyle(
                              color: AppColor.accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.1,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const RegisterPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
