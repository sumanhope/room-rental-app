import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/pages/terms.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/verification/emailverification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final placeController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimpasswordController = TextEditingController();
  DateTime today = DateTime.now();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool ischecked = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    fullnameController.dispose();
    placeController.dispose();
    passwordController.dispose();
    confrimpasswordController.dispose();
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

  Future registerAcc() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User user = auth.currentUser!;
      final uid = user.uid;
      String date = "${today.month}/${today.day}/${today.year}";
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'userid': uid,
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
        'fullname': fullnameController.text.trim(),
        'place': placeController.text.trim(),
        'accountcreatedon': date,
        'profilelink': '',
      }).then(
        (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const EmailVerificationPage();
              },
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      errorDialog(e.toString());
    }
  }

  bool passwordConfirmed(String password, String confirmpassword) {
    if (password == confirmpassword) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      color: AppColor.primaryColor,
                      height: size.height * 0.20,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
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
            const Text(
              "Create Account",
              style: AppText.orangeXLText,
            ),
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                physics: const ScrollPhysics(),
                steps: getSteps(),
                currentStep: currentStep,
                connectorColor: const MaterialStatePropertyAll(
                  AppColor.primaryColor,
                ),
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length - 1;
                  if (isLastStep) {
                    if (ischecked) {
                      registerAcc();
                    } else {
                      errorDialog("Please check Terms and Conditions box.");
                    }
                  } else {
                    if (currentStep == 0) {
                      if (emailController.text.trim().isNotEmpty &&
                          fullnameController.text.trim().isNotEmpty &&
                          placeController.text.trim().isNotEmpty) {
                        setState(() {
                          currentStep += 1;
                        });
                      } else {
                        errorDialog("Please fill all the fields.");
                      }
                    } else if (currentStep == 1) {
                      if (usernameController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty &&
                          confrimpasswordController.text.trim().isNotEmpty) {
                        if (passwordConfirmed(passwordController.text,
                            confrimpasswordController.text)) {
                          setState(() {
                            currentStep += 1;
                          });
                        } else {
                          errorDialog("Password doesn't match");
                        }
                      } else {
                        errorDialog("Please fill all the fields.");
                      }
                    }
                  }
                },
                onStepTapped: (value) => setState(
                  () {
                    currentStep = value;
                  },
                ),
                onStepCancel: currentStep == 0
                    ? null
                    : () => setState(() => currentStep -= 1),
                controlsBuilder: (context, details) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, right: 5),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        if (currentStep != 0)
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: details.onStepCancel,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(88, 0, 0, 0),
                                  ),
                                ),
                                child: const Text(
                                  'Back',
                                  style: AppText.whitenormalbuttonText,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                              ),
                              child: const Text(
                                'Next',
                                style: AppText.whitenormalbuttonText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(
          "Personal",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            CustomFormField(
              controller: emailController,
              title: "Email",
              leading: Icons.email_outlined,
              type: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              controller: fullnameController,
              title: "FullName",
              leading: Icons.badge_outlined,
              type: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              controller: placeController,
              title: "Place",
              leading: Icons.my_location_outlined,
              type: TextInputType.text,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(
          "Account",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            CustomFormField(
              controller: usernameController,
              title: "Username",
              leading: Icons.person,
              type: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              controller: passwordController,
              title: "Password",
              leading: Icons.password_outlined,
              type: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              controller: confrimpasswordController,
              title: "Confrim Password",
              leading: Icons.password_outlined,
              type: TextInputType.text,
            )
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text(
          "Confirm",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            Container(
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2D6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Full name : ${fullnameController.text} '
                  '\nPlace : ${placeController.text}'
                  '\nEmail : ${emailController.text}'
                  '\nUsername : ${usernameController.text}'
                  '\nPassword : ${passwordController.text}'
                  '\nConfirmPassword : ${confrimpasswordController.text}',
                  style: AppText.blacksmallText,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ischecked,
                  onChanged: (value) {
                    setState(() {
                      ischecked = value!;
                    });
                  },
                  activeColor: AppColor.accentColor,
                  side: const BorderSide(
                    color: AppColor.accentColor,
                    width: 2,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TermsPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.accentColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.leading,
    required this.type,
  });

  final TextEditingController controller;
  final String title;
  final IconData leading;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFF2D6),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
        labelText: title,
        labelStyle: AppText.labelText,
        prefixIcon: Icon(
          leading,
          color: AppColor.primaryColor,
          size: 30,
        ),
        suffixIcon: controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.primaryColor,
                ),
                onPressed: () => controller.clear(),
              ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
      ),
      style: AppText.textfieldText,
      keyboardType: type,
      textInputAction: TextInputAction.next,
      cursorColor: AppColor.accentColor,
    );
  }
}
