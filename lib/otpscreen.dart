import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/resetpassward.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
// import 'package:sunkonnect/widgets/customtextviews.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Verify OTP",
      ),
      // appBar: AppBar(
      //   title: Text('Verify OTP',
      //       style: GoogleFonts.poppins(
      //         fontSize: 20,
      //         fontWeight: FontWeight.w600,
      //         color: Colours.kheadertext,
      //       )),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter OTP Code Sent To Your Email',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // SizedBox(
            //   height: 50,
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => Resetpassward()));
            //       },
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: Colours.kbuttonpurple,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10))),
            //       child: Text('Verify',
            //           style: GoogleFonts.poppins(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.white,
            //           ))),
            // ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
          left: 25,
        ),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: FloatingActionButton.extended(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Resetpassward()));
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMessage()));
            },
            label: const CustomText(
                text: 'Verify',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.white),
            backgroundColor: Colours.kbuttonpurple,
          ),
        ),
      ),
    );
  }
}
