import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appbarColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: size.width,
                  height: size.height * 0.35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(200),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Reserve your room now! ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Save ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'SpaceMono',
                  ),
                  children: [
                    TextSpan(
                      text: 'money ',
                      style: TextStyle(
                        color: AppColor.secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'with our rental room.',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Rent rooms with reasonable price, beautiful location, "
                "flexible layout options and much more. Rent the room of your dreams.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xCE8D0000).withAlpha(50),
                            blurRadius: 10.0,
                            spreadRadius: 8.0,
                            offset: const Offset(
                              2.0,
                              3.0,
                            ),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shadowColor: AppColor.extraColor,
                          backgroundColor: AppColor.secondaryColor,
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: const Text(
                          "Rent Room",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: const Text(
                          "Learn More",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
