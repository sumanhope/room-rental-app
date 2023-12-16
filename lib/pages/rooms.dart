import 'package:flutter/material.dart';
import 'package:roomrentalapp/components/roomcard.dart';
import 'package:roomrentalapp/themes/colors.dart';

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
        backgroundColor: AppColor.appbarColor,
        title: const Text(
          "Rooms",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
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
