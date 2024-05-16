import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/otpscreen.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
// import 'package:sunkonnect/widgets/customtextviews.dart';

class Forgotpassward extends StatefulWidget {
  const Forgotpassward({super.key});

  @override
  State<Forgotpassward> createState() => _ForgotpasswardState();
}

class _ForgotpasswardState extends State<Forgotpassward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Forgot Password",
      ),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Center(
      //     child: Text('Forgot Password',
      //         style: GoogleFonts.poppins(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w600,
      //           color: Colours.kheadertext,
      //         )),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Forgot Password',
              //     textAlign: TextAlign.left,
              //     style: GoogleFonts.poppins(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600,
              //       color: Colours.kheadertext,
              //     )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a Email";
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please Enter a Valid Email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.montserrat(
                      color: Colours.klightgrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                    child: Icon(
                      Icons.email,
                      color: Colours.klightgrey,
                      size: 22,
                    ),
                  ),
                  //  contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colours.kbordergrey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colours.kbordergrey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colours.kbordergrey)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colours.kbordergrey)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: SizedBox(
              //     height: 50,
              //     width: double.infinity,
              //     child: ElevatedButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => OTPScreen()));
              //         },
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: Colours.kbuttonpurple,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10))),
              //         child: Text('Send OTP',
              //             style: GoogleFonts.poppins(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.white,
              //             ))),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: FloatingActionButton.extended(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OTPScreen()));
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMessage()));
            },
            label: const CustomText(
                text: 'Send OTP',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.white),
            backgroundColor: Colours.kbuttonpurple,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
