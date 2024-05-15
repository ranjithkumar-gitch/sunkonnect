import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(text: title, fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colours.kdarkgrey);
  }
}
