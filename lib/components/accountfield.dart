import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    super.key,
    required this.size,
    required this.title,
    required this.value,
  });

  final Size size;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: AppColor.extraColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppText.greysmallText,
            ),
            Text(
              value,
              style: AppText.blacknormalText,
            ),
          ],
        ),
      ),
    );
  }
}
