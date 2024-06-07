import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/loginflow/forgotpassward.dart';
import 'package:sunkonnect/loginflow/model/login_request_model.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isValidPassword(String password) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$');
    return regex.hasMatch(password);
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final emailController = TextEditingController();

  final passwordController =  TextEditingController();

 late Loginrequestauth requestModelId;

  bool password = true;

  @override
  void initState() {
    super.initState();
    requestModelId = Loginrequestauth(
        role: "User",
        emailId: "",
        password: "",
        );
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      Image(image: AssetImage('assets/sunkpo.png')),
                      SizedBox(
                        height: 45,
                      ),
                    
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: 'Login', fontSize: 25, fontWeight:  FontWeight.w600, textcolor: Colours.kheadertext),
                
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
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
                // Text('Password',
                //     style: GoogleFonts.poppins(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.black,
                //     )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                     controller: passwordController,
                     validator: (value) {
                        if (value!.isEmpty) {
                     return "Please Enter a Password";
                        } else if (!_isValidPassword(value)) {
                       return "Password must be at least 7 characters, along special ,numeric , one Uppercase ";
                         }
                        return null;
                            },
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Forgotpassward()));
                  },
                  child:  Text("Forgot Password?",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.montserrat(
                        color: Colours.korange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
      
      requestModelId.emailId = emailController.text;
      requestModelId.password = passwordController.text;

      
      print('Payload Data:');
      print('Email: ${requestModelId.emailId}');
      print('Password: ${requestModelId.password}');

      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colours.kbuttonpurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text('Login',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
