import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/components/logincontainer.dart';
import 'package:roomrentalapp/components/profilebutton.dart';
import 'package:roomrentalapp/themes/colors.dart';

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
        backgroundColor: AppColor.appbarColor,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
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
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "Kathmandu",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
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
                func: () {},
                leading: EvaIcons.person,
                title: "Account Details",
              ),
              ProfileButton(
                size: size,
                func: () {},
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
                func: () {},
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
