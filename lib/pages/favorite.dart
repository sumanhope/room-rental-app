import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbarColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}
