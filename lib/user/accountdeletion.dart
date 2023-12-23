import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/customoutlinebutton.dart';
import 'package:roomrentalapp/components/editdetailsfield.dart';
import 'package:roomrentalapp/themes/texts.dart';

class AccountDeletionPage extends StatefulWidget {
  const AccountDeletionPage({super.key});

  @override
  State<AccountDeletionPage> createState() => _AccountDeletionPageState();
}

class _AccountDeletionPageState extends State<AccountDeletionPage> {
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Account Deletion",
          arrow: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Deleting your account is permanent. When you delete "
                    "your roomrental account, you won't be able to retrieve "
                    "the content or information that you've shared on this app.",
                    style: AppText.blacksmallText,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 2,
                    bottom: 15,
                  ),
                  child: EditDetailsField(
                    label: "Your Password",
                    controller: passwordController,
                    action: TextInputAction.done,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: CustomOutlineButton(
                      func: () {
                        Navigator.of(context).pop();
                      },
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
