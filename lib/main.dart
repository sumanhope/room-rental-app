import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  final List<Widget> pages = [];

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
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: GNav(
              hoverColor: Theme.of(context).hoverColor,
              backgroundColor: Theme.of(context).colorScheme.background,
              color: Theme.of(context).unselectedWidgetColor,
              activeColor: Theme.of(context).focusColor,
              tabBackgroundColor: Colors.black,
              gap: 6,
              padding: const EdgeInsets.all(10),
              iconSize: 25,
              textStyle: TextStyle(
                fontSize: 15,
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              tabs: const [
                GButton(
                  icon: EvaIcons.home,
                  text: "Home",
                ),
                GButton(
                  icon: FontAwesome.searchengin,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.speed,
                  text: "Track",
                ),
                GButton(
                  icon: Icons.rice_bowl,
                  text: "Foods",
                ),
                GButton(
                  icon: Icons.person,
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
