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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8,
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
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Suman Shrestha",
                          style: AppText.blacknormalText,
                        ),
                        Text(
                          "Kathmandu",
                          style: AppText.blackSmallItalicText,
                        ),
                      ],
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
                title: "Account Details",
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
                title: "Settings",
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
              LoginContainer(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
