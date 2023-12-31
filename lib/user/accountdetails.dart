import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomrentalapp/components/accountfield.dart';
import 'package:roomrentalapp/components/customappbar.dart';

import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:roomrentalapp/user/editdetails.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  final firestore = FirebaseFirestore.instance;
  final User user = FirebaseAuth.instance.currentUser!;
  String uid = "";
  String fullname = "Loading";
  String email = "Loading";
  String username = "Loading";
  String place = "Loading";
  String accountcreatedon = "Loading";
  String profilelink = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    uid = user.uid;
    final DocumentSnapshot userDoc =
        await firestore.collection('users').doc(uid).get();
    setState(
      () {
        fullname = userDoc.get('fullname');
        email = userDoc.get('email');
        username = userDoc.get('username');
        place = userDoc.get('place');
        profilelink = userDoc.get('profilelink');
        accountcreatedon = userDoc.get('accountcreatedon');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: "Account Details", arrow: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/defaultprofile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 4),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
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
              AccountField(
                size: size,
                title: "Full Name",
                value: fullname,
              ),
              AccountField(
                size: size,
                title: "Email",
                value: email,
              ),
              AccountField(
                size: size,
                title: "Username",
                value: username,
              ),
              AccountField(
                size: size,
                title: "Place",
                value: place,
              ),
              AccountField(
                size: size,
                title: "Account created on",
                value: accountcreatedon,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const EditDetailsPage();
                        },
                      ),
                    );
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
                    "Edit Information",
                    style: AppText.blacknormalText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
