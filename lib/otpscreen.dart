import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sunkonnect/resetpassward.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Verify OTP",
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(text: 'Enter OTP Code Sent To Your Email', fontSize: 16, fontWeight: FontWeight.w600, textcolor: Colours.kheadertext),
            
           const  SizedBox(height: 20.0),
           
                        Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colours.kbordergrey,
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onCompleted: (value) {
                          
                        },
                      ),
        
            const SizedBox(height: 20.0),
           
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
                  MaterialPageRoute(builder: (context) => const Resetpassward()));
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








// ranjith previous code 

// final List<TextEditingController> _controllers =
//       List.generate(6, (_) => TextEditingController());

         // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: List.generate(
            //     6,
            //     (index) => SizedBox(
            //       width: 50,
            //       child: TextFormField(
            //         controller: _controllers[index],
            //         keyboardType: TextInputType.number,
            //         maxLength: 1,
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(
            //           fontSize: 20.0,
            //         ),
            //         decoration:const  InputDecoration(
            //           counterText: "",
            //           border: OutlineInputBorder(),
            //         ),
            //         onChanged: (value) {
            //           if (value.length == 1 && index < 5) {
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //       ),
            //     ),
            //   ),
            // ),
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