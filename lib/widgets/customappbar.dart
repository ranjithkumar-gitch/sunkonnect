import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colours.korange,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colours.kwhiteColor,size: 20,),
        ),
        title: CustomText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textcolor: Colours.kwhiteColor,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
