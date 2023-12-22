import 'package:flutter/material.dart';
import 'package:roomrentalapp/themes/colors.dart';
import 'package:roomrentalapp/themes/texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.arrow,
    super.key,
  });
  final String title;
  final bool arrow;
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: Text(
        title,
        style: AppText.appbarText,
      ),
      centerTitle: true,
      leading: arrow
          ? IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : Container(),
      automaticallyImplyLeading: false,
    );
  }
}
