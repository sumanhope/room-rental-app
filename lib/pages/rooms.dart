import 'package:flutter/material.dart';
import 'package:roomrentalapp/components/roomcard.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            RoomCard(
              roomfloor: "First Floor",
              uploadDate: "12/16/2023",
              press: () {},
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
    );
  }
}
