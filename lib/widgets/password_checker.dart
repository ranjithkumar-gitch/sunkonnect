import 'package:flutter/material.dart';

class PassCheckRequirements extends StatelessWidget {
  final bool? passCheck;

  final String? requirementText;

  final IconData? activeIcon;

  final IconData? inActiveIcon;

  final Color? inActiveColor;

  final Color? activeColor;

  const PassCheckRequirements({
    Key? key,
    @required this.passCheck,
    @required this.requirementText,
    this.inActiveIcon = Icons.check_circle_rounded,
    this.activeIcon = Icons.check_circle_rounded,
    this.inActiveColor = const Color(0xffE3E5EA),
    this.activeColor = const Color(0xff2A9C02),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23.0, right: 23.0),
      child: Row(
        children: [
          passCheck!
              ? Icon(Icons.check_circle_rounded, color: activeColor)
              : Icon(Icons.circle, color: inActiveColor),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              requirementText!,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff303135),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
