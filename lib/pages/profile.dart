import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
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
            )
          ],
        ),
      )),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.size,
    required this.func,
    required this.leading,
    required this.title,
  });

  final Size size;
  final VoidCallback func;
  final IconData leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.07,
        child: TextButton(
          onPressed: func,
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Icon(
                leading,
                size: 27,
                color: Colors.white,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
