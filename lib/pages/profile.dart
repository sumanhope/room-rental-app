import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/components/logincontainer.dart';
import 'package:roomrentalapp/components/profilebutton.dart';
import 'package:roomrentalapp/pages/aboutus.dart';
import 'package:roomrentalapp/pages/addroom.dart';
import 'package:roomrentalapp/pages/contact.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/accountdetails.dart';
import 'package:roomrentalapp/user/accountsetting.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: AppText.appbarText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 8,
                      left: 10,
                      right: 5,
                    ),
                    child: Container(
                      width: size.width * 0.29,
                      height: size.width * 0.29,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/defaultprofile.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "pauroti",
                          style: AppText.blacknormalText,
                        ),
                        Text(
                          "Kathmandu",
                          style: AppText.blackSmallItalicText,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: size.width * 0.22,
                      height: size.height * 0.05,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          side: const BorderSide(
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "BYE",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1.7,
                indent: 10,
                endIndent: 10,
              ),
              ProfileButton(
                size: size,
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AccountDetailsPage();
                      },
                    ),
                  );
                },
                leading: EvaIcons.person,
                title: "Suman Shrestha",
              ),
              ProfileButton(
                size: size,
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddRoomPage();
                      },
                    ),
                  );
                },
                leading: FontAwesome.plus,
                title: "Add Room",
              ),
              ProfileButton(
                size: size,
                func: () {},
                leading: EvaIcons.settings_2,
                title: "App Settings",
              ),
              ProfileButton(
                size: size,
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AccountSettingPage();
                      },
                    ),
                  );
                },
                leading: Icons.security_outlined,
                title: "Account and Password",
              ),
              ProfileButton(
                size: size,
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ContactPage();
                      },
                    ),
                  );
                },
                leading: Icons.contact_mail_outlined,
                title: "Contact",
              ),
              ProfileButton(
                size: size,
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutUsPage();
                      },
                    ),
                  );
                },
                leading: EvaIcons.activity_outline,
                title: "About",
              ),
              LoginContainer(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
