import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/forgotpassward.dart';
import 'package:sunkonnect/loginpage.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class Resetpassward extends StatefulWidget {
  const Resetpassward({super.key});

  @override
  State<Resetpassward> createState() => _ResetpasswardState();
}

class _ResetpasswardState extends State<Resetpassward> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Forgot Password",
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    // Image(image: AssetImage('assets/sunkpo.png')),
                    SizedBox(
                      height: 45,
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(text: 'New Password', fontSize: 16, fontWeight: FontWeight.w400, textcolor: Colours.klightgrey),
           
              
              const SizedBox(
                height: 10,
              ),
              
              SizedBox(
                height: 70,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        icon: password
                            ? (const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ))
                            : const Icon(
                                Icons.visibility,
                                color: Colours.klightgrey,
                              )),
                    hintText: "Password",
                    hintStyle: GoogleFonts.montserrat(
                        color: Colours.klightgrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.lock,
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
              const CustomText(text: 'Confirm New Password', fontSize: 16, fontWeight: FontWeight.w400, textcolor: Colours.klightgrey),
              
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        icon: password
                            ? (const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ))
                            : const Icon(
                                Icons.visibility,
                                color: Colours.klightgrey,
                              )),
                    hintText: "Password",
                    hintStyle: GoogleFonts.montserrat(
                        color: Colours.klightgrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.lock,
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
              
              const SizedBox(height: 30),
             
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
             
            },
            label: const CustomText(
                text: 'Change',
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
               