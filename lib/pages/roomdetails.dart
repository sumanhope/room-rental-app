import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class RoomDetailsPage extends StatefulWidget {
  const RoomDetailsPage({super.key});

  @override
  State<RoomDetailsPage> createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
  int currentpage = 0;
  PageController pageController = PageController();
  final String floor = "Ground Floor";
  final String roomNo = "1";
  final String location = "Suidibar, Lamjung";
  final String totalRent = "5000";
  final String contactNo = "9818167498";
  final String description = "";
  final String terms = "";
  final String postedDate = "12/16/2023";
  bool isBookMarked = false;
  final imageslink = [
    'assets/images/livingroom.jpg',
    'assets/images/welcome.png',
    'assets/images/livingroom.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Room Details",
          style: AppText.appbarText,
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: PageView.builder(
                  controller: pageController,
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imageslink.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentpage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: size.width,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        color: AppColor.extraColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            imageslink[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    floor,
                    style: AppText.blackbigText,
                  ),
                  IconButton(
                    onPressed: () {
                      if (isBookMarked) {
                        setState(
                          () {
                            isBookMarked = false;
                          },
                        );
                      } else {
                        setState(
                          () {
                            isBookMarked = true;
                          },
                        );
                      }
                    },
                    icon: Icon(
                      isBookMarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_outlined,
                      size: 30,
                      color: AppColor.accentColor,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColor.accentColor,
                thickness: 2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rooms: $roomNo",
                        style: AppText.blacknormalText,
                      ),
                      Text(
                        location,
                        style: AppText.blacknormalText,
                      ),
                      Text(
                        "Monthly Rent: NPR $totalRent",
                        style: AppText.blacknormalText,
                      ),
                      Text(
                        "LandLord Contact: $contactNo",
                        style: AppText.blacknormalText,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColor.accentColor,
                thickness: 2,
              ),
              // OutlinedButton(
              //   onPressed: () {},
              //   style: OutlinedButton.styleFrom(
              //     backgroundColor: AppColor.primaryColor,
              //     side: const BorderSide(color: Colors.black, width: 2),
              //   ),
              //   child: const Text(
              //     "Modern",
              //     style: AppText.whitenormalbuttonText,
              //   ),
              // ),
              const Text(
                "It is a long established fact that a reader will be distracted"
                " by the readable content of a page when looking at its layout."
                " The point of using Lorem Ipsum is that it has a more-or-less"
                " normal distribution of letters, as opposed to using 'Content"
                " here, content here', making it look like readable English."
                " Many desktop publishing packages and web page editors now use"
                " Lorem Ipsum as their default model text, and a search for"
                " 'lorem ipsum' will uncover many web sites still in their"
                " infancy. Various versions have evolved over the years,"
                " sometimes by accident, sometimes on purpose (injected humour"
                " and the like).",
                style: AppText.blacksmallText,
                textAlign: TextAlign.justify,
              ),
              const Divider(
                color: AppColor.accentColor,
                thickness: 2,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Terms and Conditions",
                  style: AppText.blacknormalText,
                ),
              ),
              const Text(
                "It is a long established fact that a reader will be distracted"
                " by the readable content of a page when looking at its layout."
                " The point of using Lorem Ipsum is that it has a more-or-less"
                " normal distribution of letters, as opposed to using 'Content"
                " here, content here', making it look like readable English.",
                style: AppText.blacksmallText,
                textAlign: TextAlign.justify,
              ),
              const Divider(
                color: AppColor.accentColor,
                thickness: 2,
              ),
              Text(
                "Posted on: $postedDate",
                style: AppText.blackSmallItalicText,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < imageslink.length; i++) {
      indicators.add(
        Container(
          width: 25,
          height: 5,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            shape: BoxShape.rectangle,
            color: currentpage == i ? AppColor.primaryColor : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
