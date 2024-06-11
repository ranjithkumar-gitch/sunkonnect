import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sunkonnect/loginflow/resetpassward.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progressbar.dart';
import 'package:sunkonnect/widgets/snackbar.dart';


class OTPScreen extends StatefulWidget {

  String VerificationCode;

   OTPScreen({
    required this.VerificationCode,
    super.key});


  @override
    State<OTPScreen> createState() => _OTPScreenState();
  
}

class _OTPScreenState extends State<OTPScreen> {
  bool isApiCallProcess = false;
final TextEditingController _pinPutController = TextEditingController();

final FocusNode _pinPutFocusNode = FocusNode();

 BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

   @override
  void initState() {
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
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
           
                        Container(
                                margin:
                                    EdgeInsets.only(left: 20.0, right: 20.0),
                                child: PinPut(
                                  fieldsCount: 6,
                                  textStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  onSubmit: (String pin) =>
                                      (pin, context),
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: true),
                                  submittedFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xFFFF6700),
                                    ),
                                  ),
                                  selectedFieldDecoration: _pinPutDecoration,
                                  followingFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xFFFF6700),
                                    ),
                                  ),
                                ),
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
              if(widget.VerificationCode == _pinPutController.text.toString()){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Resetpassward()));
              }else{
                showToast('Incorrect Verification Code');
              }
             
              
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