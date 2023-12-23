import 'package:flutter/material.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/components/profilebutton.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/accountdeletion.dart';
import 'package:roomrentalapp/user/changepassword.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: "Account and Password", arrow: true),
      body: Center(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 10,
                ),
                child: Text(
                  "Password",
                  style: AppText.blacknormalText,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 2),
                child: Text(
                  "Manage your password.",
                  style: AppText.blacksmallText,
                ),
              ),
            ),
            ProfileButton(
              size: size,
              func: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangePasswordPage();
                    },
                  ),
                );
              },
              leading: Icons.key_outlined,
              title: "Change Password",
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2,
              color: AppColor.accentColor,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  "Account",
                  style: AppText.blacknormalText,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 2),
                child: Text(
                  "Delete your Account.",
                  style: AppText.blacksmallText,
                ),
              ),
            ),
            ProfileButton(
              size: size,
              func: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AccountDeletionPage();
                    },
                  ),
                );
              },
              leading: Icons.person_off_outlined,
              title: "Account Deletion",
            ),
          ],
        ),
      ),
    );
  }
}
