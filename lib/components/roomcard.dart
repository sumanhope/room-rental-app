import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    required this.roomfloor,
    required this.uploadDate,
    required this.press,
    required this.size,
    required this.imagelink,
  }) : super(key: key);
  final String roomfloor;
  final String uploadDate;
  final VoidCallback press;
  final Size size;
  final String imagelink;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 10),
      child: InkWell(
        onTap: press,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(206, 50, 50, 50),
                blurRadius: 3,
                offset: Offset(1, 5), // Shadow position
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.28,
                child: Image(
                  image: AssetImage(imagelink),
                  fit: BoxFit.cover,
                ),
                // decoration: BoxDecoration(
                //   color: AppColor.accentColor,
                // image: DecorationImage(
                //   image: AssetImage(imagelink),
                //   fit: BoxFit.cover,
                // ),
                //),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 10,
                ),
                child: SizedBox(
                  child: Text(
                    roomfloor,
                    softWrap: true,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: AppText.appbarText,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                  child: SizedBox(
                    child: Text(
                      uploadDate,
                      softWrap: true,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: AppText.whiteSmallItalicText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
