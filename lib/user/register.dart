import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

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
                    debugPrint("Complete");
                  } else {
                    if (currentStep == 0) {
                      setState(() {
                        currentStep += 1;
                      });
                    } else if (currentStep == 1) {
                      setState(() {
                        currentStep += 1;
                      });
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
        content: Container(
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
