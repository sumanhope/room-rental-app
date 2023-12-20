import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:roomrentalapp/components/customtextfield.dart';
import 'package:roomrentalapp/components/roomcard.dart';
import 'package:roomrentalapp/pages/roomdetails.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            "Rooms",
            style: AppText.appbarText,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 1,
                ),
                child: CustomTextField(
                  controller: searchController,
                  title: "Search",
                  leading: EvaIcons.search,
                  action: TextInputAction.done,
                  type: TextInputType.text,
                ),
              ),
              RoomCard(
                roomfloor: "First Floor",
                uploadDate: "12/16/2023",
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const RoomDetailsPage();
                      },
                    ),
                  );
                },
                size: size,
                imagelink: "assets/images/livingroom.jpg",
              ),
              RoomCard(
                roomfloor: "Second Floor",
                uploadDate: "12/16/2023",
                press: () {},
                size: size,
                imagelink: "assets/images/livingroom.jpg",
              ),
              RoomCard(
                roomfloor: "Third Floor",
                uploadDate: "12/16/2023",
                press: () {},
                size: size,
                imagelink: "assets/images/livingroom.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
