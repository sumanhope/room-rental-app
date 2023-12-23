import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/custombutton.dart';
import 'package:roomrentalapp/components/customoutlinebutton.dart';
import 'package:roomrentalapp/components/editdetailsfield.dart';
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
                    action: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditDetailsField(
                    label: "Username",
                    controller: usernameController,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditDetailsField(
                    label: "Place",
                    controller: placeController,
                    action: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                    child: CustomOutlineButton(
                      func: () {
                        Navigator.of(context).pop();
                      },
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
