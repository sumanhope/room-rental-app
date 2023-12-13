import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:roomrentalapp/pages/favorite.dart';
import 'package:roomrentalapp/pages/home.dart';
import 'package:roomrentalapp/pages/profile.dart';
import 'package:roomrentalapp/pages/rooms.dart';

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
      title: 'Flutter Demo',
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
    const FavoritePage(),
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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: GNav(
              hoverColor: Colors.white10,
              backgroundColor: Colors.black,
              color: Colors.grey,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 54, 53, 53),
              gap: 6,
              padding: const EdgeInsets.all(10),
              iconSize: 25,
              textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                GButton(
                  icon: LineAwesome.person_booth_solid,
                  text: "Welcome",
                ),
                GButton(
                  icon: FontAwesome.person_shelter,
                  text: "Search",
                ),
                GButton(
                  icon: EvaIcons.heart,
                  text: "Favorite",
                ),
                GButton(
                  icon: EvaIcons.person,
                  text: "Me",
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
