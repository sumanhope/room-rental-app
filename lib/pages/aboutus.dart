import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  roomrentalurl() async {
    Uri url = Uri.parse('https://roomrentalnpr.web.app');
    if (await launchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "About Us",
          style: AppText.appbarText,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: AppColor.extraColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Room Rental began as an idea among friends who were eager to "
                    "deepen their understanding of React and Firebase techonologies "
                    "Recognizing the value of hands-on experience, we decide to "
                    "a unique platform that would serve as a practical learning "
                    "ground.",
                    textAlign: TextAlign.center,
                    style: AppText.blacknormalText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "This app is based on the website of Room Rental. ",
                    textAlign: TextAlign.center,
                    style: AppText.blacknormalText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: roomrentalurl,
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.03,
                      decoration: BoxDecoration(
                        color: AppColor.accentTextColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Text(
                        "Click here to visit website.",
                        textAlign: TextAlign.center,
                        style: AppText.labelText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Curious to see what Room Rental has to offer? "
                    "Feel free to sign in or register to experience the "
                    "functionality firsthand. Navigate through the user "
                    "interface, interact with the features, and witness the "
                    "seamless integration of Flutter and Firebase. This platform "
                    "is a living demonstration of my commitment to excellence and "
                    "continuous improvement."
                    "\nHappy Coding!",
                    textAlign: TextAlign.center,
                    style: AppText.blacknormalText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
