import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
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
        appBar: AppBar(
          title: const Text(
            "Contact Us",
            style: AppText.appbarText,
          ),
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
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
                  child: TextFormField(
                    controller: bodyController,
                    expands: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFF2D6),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: AppColor.accentColor, width: 3),
                      ),
                      labelText: "Your Message",
                      labelStyle: AppText.labelText,
                      prefixIcon: Icon(
                        Icons.chat_bubble_outline,
                        color: AppColor.primaryColor,
                        size: 30,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: AppColor.accentColor, width: 3),
                      ),
                    ),
                    style: AppText.textfieldText,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.done,
                    cursorColor: AppColor.accentColor,
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
