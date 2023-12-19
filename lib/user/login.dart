import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/main.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/user/register.dart';

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
        labelStyle: const TextStyle(
          color: AppColor.appbarColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: const Icon(
          Icons.key,
          color: AppColor.appbarColor,
          size: 30,
        ),
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () =>
              setState(() => isPasswordVisible = !isPasswordVisible),
          color: AppColor.appbarColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
      ),
      obscureText: isPasswordVisible,
      style: const TextStyle(
        color: AppColor.appbarColor,
        fontSize: 15,
      ),
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
        //   backgroundColor: AppColor.appbarColor,
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
                        color: AppColor.appbarColor,
                        height: size.height * 0.26,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      color: AppColor.appbarColor,
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
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: AppColor.appbarColor,
                ),
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
                          style: TextStyle(
                            color: AppColor.appbarColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) {
                          //       return const ResetPasswordScreen();
                          //     },
                          //   ),
                          // );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      size: size,
                      func: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const LandingPage();
                            },
                          ),
                        );
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
                            color: AppColor.appbarColor,
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
