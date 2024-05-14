import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     SizedBox(
                      height: 30,
                    ),
                    Image(image: AssetImage('assets/LOGO.png')),
                     SizedBox(
                      height: 15,
                    ),
                    Text(
              'Konnect @ SunKpo',
              style: TextStyle(
                  color: Colours.korange,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
               child: Text('User Login',
              style: GoogleFonts.poppins(
                  fontSize: 25,
                 fontWeight: FontWeight.w500,
                 color: Colors.black,
                   )),
               ),
              
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Email Address',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                           
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
                              hintStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ),
                              //  contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 12, 10, 15),
                
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                        Text('Password',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
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
                                          color: Colors.grey,
                                        )),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ),
                              //  contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 12, 10, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text('Login',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ))),
                        ),
              
            ],
          ),
        ),
      ),
    );
  }
}
