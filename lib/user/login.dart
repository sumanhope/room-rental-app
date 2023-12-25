import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/forgotpassword.dart';
import 'package:roomrentalapp/user/register.dart';
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

  Future login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          debugPrint("Login");
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
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
                      func: () {
                        login(usernameController.text, password);
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return const EmailVerificationPage();
                        //     },
                        //   ),
                        // );
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
