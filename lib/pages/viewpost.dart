import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/pages/addroom.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({super.key});

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: "View Posts", arrow: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: size.width * 0.25,
        height: size.height * 0.09,
        child: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const AddRoomPage();
                },
              ),
            );
          },
          shape: const CircleBorder(),
          child: const Icon(
            EvaIcons.plus,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "No Post, Try adding your own post by clicking below button.",
                  style: AppText.blacksmallText,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
