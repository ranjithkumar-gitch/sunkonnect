import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textcolor;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
          color: textcolor,
          fontFamily: 'poppins',
          fontSize: fontSize,
          fontWeight: fontWeight,
        )));
  }
}

class CustomViewText extends StatelessWidget {
  final String text;
  final IconData geticon;

  const CustomViewText({
    super.key,
    required this.text,
    required this.geticon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: Row(
          children: [
            Icon(
              geticon,
              color: Colors.black,
              size: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textcolor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const CustomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onPressed,
      required this.color,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: SizedBox(
            height: 45,
            child: Center(
                child: Text(
              text,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: textColor,
                fontFamily: 'poppins',
                fontSize: fontSize,
                fontWeight: fontWeight,
              )),
            ))));
  }
}
