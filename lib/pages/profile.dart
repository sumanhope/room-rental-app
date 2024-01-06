import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/components/logincontainer.dart';
import 'package:roomrentalapp/components/profilebutton.dart';
import 'package:roomrentalapp/pages/aboutus.dart';
import 'package:roomrentalapp/pages/contact.dart';
import 'package:roomrentalapp/pages/viewpost.dart';
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
  final User? user = FirebaseAuth.instance.currentUser;
  String uid = "";
  String username = "Loading";
  String fullname = "Loading";
  String place = "Loading";
  @override
  void initState() {
    if (user != null) {
      getData();
    }
    super.initState();
  }

  void getData() async {
    uid = user!.uid;

    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      username = userDoc.get('username');
      fullname = userDoc.get('fullname');
      place = userDoc.get('place');
    });
    //print(username);
  }

  showWidget(final size) {
    if (user != null) {
      return Column(
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: AppText.blacknormalText,
                    ),
                    const Text(
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
                        color: AppColor.accentColor,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        setState(() {});
                      });
                    },
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
            color: AppColor.accentColor,
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
                    return const ViewPostPage();
                  },
                ),
              );
            },
            leading: Icons.post_add,
            title: "View Posts",
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
        ],
      );
    } else {
      return LoginContainer(size: size);
    }
  }

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
              showWidget(size),
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
                        return const ContactPage();
                      },
                    ),
                  );
                },
                leading: Icons.contact_mail_outlined,
                title: "Contact Us",
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
                title: "About Us",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
