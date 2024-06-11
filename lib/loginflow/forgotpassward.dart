import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/loginflow/model/forgot_request_model.dart';
import 'package:sunkonnect/loginflow/otpscreen.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progressbar.dart';
import 'package:sunkonnect/widgets/snackbar.dart';


class Forgotpassward extends StatefulWidget {
  const Forgotpassward({super.key});

  @override
  State<Forgotpassward> createState() => _ForgotpasswardState();
}

class _ForgotpasswardState extends State<Forgotpassward> {
   bool isApiCallProcess = false;

   final emailController = TextEditingController();

   late ForgotPasswordRequestModel requestModelId;

   @override
  void initState() {
    super.initState();
    requestModelId = ForgotPasswordRequestModel(
      userId: "",
      secret: "",
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        title: "Forgot Password",
      ),
    
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    controller: emailController,
                    autofillHints: const [AutofillHints.email],
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
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                    ),
                  ),
                ),
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
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isApiCallProcess = true;
                });
              

              

                          
                          ApiService apiService = ApiService();

                          apiService.getSecretCode().then((value) {
                            if (value.status == 203) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                            } else if (value.status == 401) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              
                            } else if (value.status == 400) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                              
                            } else if (value.status == 404) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              
                            } else if (value.status == 200 ||
                                value.status == 201) {
                              
                              print("Verification URL is perfectly working");
                              print(value.data!.secret.toString());

                              requestModelId.secret = value.data!.secret.toString();
                              requestModelId.userId = emailController.text.toString().trim();
                              //loginId, userId, name, roleCode, roleDescription, status, accessToken, refreshToken, userObjId//
                              

                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) {
                              //       return const DashboardScreen();
                              //     },
                              //   ),
                              // );

                              getOTP();
                            } else {
                              setState(() {
                                isApiCallProcess = false;
                              });
                            }
                          });
                        }
             
             
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
  
  void getOTP() {
     ApiService apiService = ApiService();

                          apiService.getOTPByPost(requestModelId).then((value) {
                            if (value.status == 203) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                            } else if (value.status == 401) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              showToast("Please Enter valid email or password");
                            } else if (value.status == 400) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                              showToast("Please Enter valid email or password");
                            } else if (value.status == 404) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              showToast("Please Enter valid email or password");
                            } else if (value.status == 200 ||
                                value.status == 201) {
                              showToast("Verification Code Sent Successfully");
                              // print("login url is working perfect uday");
                              //loginId, userId, name, roleCode, roleDescription, status, accessToken, refreshToken, userObjId//
                               setState(() {
                                SharedPrefServices.setuserId(requestModelId.userId);
                                isApiCallProcess = false;

                              });

                               Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  OTPScreen(VerificationCode: value.data!.token.toString(),)));
                            } else {
                              setState(() {
                                isApiCallProcess = false;
                              });
                            }
                          });
  }
}
