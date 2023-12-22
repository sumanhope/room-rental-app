import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: const CustomAppBar(title: "Contact Us", arrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "Get in Touch",
                  style: AppText.orangeXLText,
                ),
                const Text(
                  "Let's talk about your project",
                  style: AppText.blacknormalText,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: nameController,
                  leading: Icons.badge_outlined,
                  title: "Your Name",
                  action: TextInputAction.next,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  leading: Icons.email_outlined,
                  title: "Your Email",
                  action: TextInputAction.next,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  leading: Icons.phone_outlined,
                  title: "Your Number",
                  action: TextInputAction.next,
                  type: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: CustomTextForm(
                    controller: bodyController,
                    label: "Your Message",
                    leading: Icons.chat_bubble_outline,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  size: size,
                  func: () {},
                  title: "Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.label,
    required this.leading,
  });

  final TextEditingController controller;
  final String label;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFF2D6),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
        labelText: label,
        labelStyle: AppText.labelText,
        prefixIcon: Icon(
          leading,
          color: AppColor.primaryColor,
          size: 30,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColor.accentColor, width: 3),
        ),
      ),
      style: AppText.textfieldText,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.next,
      cursorColor: AppColor.accentColor,
    );
  }
}
