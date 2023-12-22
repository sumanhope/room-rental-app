import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  final fullnameController = TextEditingController();
  final usernameController = TextEditingController();
  final placeController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: const CustomAppBar(title: "Edit Details", arrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width * 0.55,
                    child: const Text(
                      "Only fill the field you want to edit.",
                      style: AppText.blacknormalText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(
                    color: AppColor.accentColor,
                    thickness: 2,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal Information",
                      style: AppText.blacknormalText,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditDetailsField(
                    label: "Full Name",
                    controller: fullnameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditDetailsField(
                    label: "Username",
                    controller: usernameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditDetailsField(
                    label: "Place",
                    controller: placeController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [

                  //     SizedBox(
                  //       width: size.width * 0.35,
                  //       child: CustomButton(
                  //         size: size,
                  //         func: () {},
                  //         title: "Save",
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: CustomButton(
                      size: size,
                      func: () {},
                      title: "Save Changes",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: AppColor.accentColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: AppText.blacknormalText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditDetailsField extends StatelessWidget {
  const EditDetailsField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: AppText.labelText,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          style: AppText.textfieldText,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFFFF2D6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColor.accentColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColor.accentColor,
                width: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
