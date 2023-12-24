import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/pages/bookmark.dart';
import 'package:roomrentalapp/pages/home.dart';
import 'package:roomrentalapp/pages/profile.dart';
import 'package:roomrentalapp/pages/rooms.dart';
import 'package:roomrentalapp/themes/colors.dart';

void main() {
  runApp(const MyApp());
  GoogleFonts.config.allowRuntimeFetching = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'SpaceMono'),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> pages = [
    const HomePage(),
    const RoomPage(),
    const BookmarkPage(),
    const ProfilePage(),
  ];

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: pages[currentStep],
        bottomNavigationBar: Container(
          color: AppColor.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: GNav(
              hoverColor: Colors.white10,
              backgroundColor: AppColor.secondaryColor,
              color: const Color.fromARGB(218, 224, 224, 224),
              activeColor: Colors.white,
              tabBackgroundColor: AppColor.accentColor,
              gap: 6,
              padding: const EdgeInsets.all(10),
              iconSize: 25,
              textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                const GButton(
                  icon: LineAwesome.person_booth_solid,
                  text: "Welcome",
                ),
                const GButton(
                  icon: EvaIcons.search_outline,
                  text: "Rooms",
                ),
                GButton(
                  icon: currentStep == 2
                      ? EvaIcons.bookmark
                      : EvaIcons.bookmark_outline,
                  text: "Bookmark",
                ),
                GButton(
                  icon: currentStep == 3
                      ? EvaIcons.person
                      : EvaIcons.person_outline,
                  text: "Profile",
                ),
              ],
              selectedIndex: currentStep,
              onTabChange: (index) {
                setState(() {
                  currentStep = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
