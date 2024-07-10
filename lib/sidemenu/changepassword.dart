import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/loginflow/loginpage.dart';
import 'package:sunkonnect/loginflow/model/password_update_request_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/password_checker.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isValidPassword(String password) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$');
    return regex.hasMatch(password);
  }

  String _pass = "";

  bool isApiCallProcess = false;

  bool _showRequirements = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  final _passwprdonecontroller = TextEditingController();
  final _passwprdtwocontroller = TextEditingController();

  bool _passwordVisibleone = false;
  bool _passwordVisibletwo = false;
  bool currentPassword = true;
  bool newPassword = true;
  bool confirmPassword = true;

  TextEditingController currentPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Passwordupdaterequestmodel requestmodel;

  @override
  void initState() {
    super.initState();
    requestmodel = Passwordupdaterequestmodel(
      userId: '',
      password: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(title: 'Change Password'),
        body: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: const Color(0XffF6F7F7),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XffF6F7F7),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.password,
                          color: Colours.kbuttonpurple,
                          size: 30,
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Email',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colours.ksubheadertext,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colours.kcardbgColor,
                        border: Border.all(color: Colours.kbordergrey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.grey,
                            size: 22,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                              text: SharedPrefServices.getuserId().toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textcolor: Colors.black)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    ' Old Password',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colours.ksubheadertext,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 70,
                      child: TextFormField(
                          // obscureText: currentPassword,
                          controller: currentPasswordController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 10, 10, 10),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                              ),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.fromLTRB(12, 10, 10, 10),
                              child: Icon(
                                Icons.lock,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                            suffixIcon:
                               
                                   const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                            hintText: "Old Password",
                            hintStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                                width: 1.0,
                              ),
                            ),
                          ))),
                  Text(
                    ' New Password',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colours.ksubheadertext,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      controller: _passwprdonecontroller,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          _pass = value;
                          _showRequirements = !_isValidPassword(value);
                          print(_pass);
                        });
                      },

                      obscureText: !_passwordVisibleone,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please Enter New  Password";
                      //   } else if (!_isValidPassword(value)) {
                      //     return "Password must be at least 7 characters, along special ,numeric , one Uppercase ";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(12, 10, 10, 10),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(12, 10, 10, 10),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisibleone
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff979797),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisibleone = !_passwordVisibleone;
                            });
                          },
                        ),
                        hintText: "New Password",
                        hintStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colours.kbordergrey,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colours.kbordergrey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colours.kbordergrey,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colours.kbordergrey,
                            )),
                      ),

                      maxLines: 1,
                      validator: (input) => input!.length <= 7
                          ? "Atleast Eight charecters"
                          : null,
                      onSaved: (input) =>
                          SharedPrefServices.setpassword(input!),
                    ),
                  ),
                  if (_showRequirements)
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colours.kbordergrey)),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          PassCheckRequirements(
                            passCheck: _pass.length >= 8 && _pass.length <= 15,
                            requirementText:
                                "Be a minimum of 8 and a maximum of 15 Characters",
                          ),
                          const SizedBox(height: 5.0),
                          PassCheckRequirements(
                            passCheck: _pass.contains(RegExp(r'[A-Z]')),
                            requirementText:
                                "have at least one uppercase letter (A-Z)",
                          ),
                          const SizedBox(height: 5.0),
                          PassCheckRequirements(
                            passCheck: _pass.contains(RegExp(r'[a-z]')),
                            requirementText:
                                "have at least one lowercase alphabet (a-z)",
                          ),
                          const SizedBox(height: 5.0),
                          PassCheckRequirements(
                            passCheck: _pass.contains(RegExp(r'[0-9]')),
                            requirementText: "have at least one number (0-9)",
                          ),
                          const SizedBox(height: 5.0),
                          PassCheckRequirements(
                            passCheck: _pass
                                .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
                            requirementText:
                                "have at least one special character",
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  if (_showRequirements)
                    const SizedBox(
                      height: 10,
                    ),
                  Text(
                    ' Confirm Password',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colours.ksubheadertext,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: _passwprdtwocontroller,
                        obscureText: _passwordVisibletwo,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        //      validator: (value) {
                        //        if (value!.isEmpty) {
                        //         return "Please Confirm New  Password";
                        //        } else if (!_isValidPassword(value)) {
                        // return "Password must be at least 7 characters, with at least one uppercase letter, one numeric digit, and one special character";
                        //           } else if (value !=
                        //       _passwprdonecontroller.text) {
                        //         return "Passwords do not match";
                        //                 }
                        //                 return null;
                        //               },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 10, 10, 10),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisibletwo
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xff979797),
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisibletwo = !_passwordVisibletwo;
                              });
                            },
                          ),
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colours.kbordergrey,
                              )),
                        ),
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        validator: (input) =>
                            input == _passwprdonecontroller.text
                                ? "Atleast six charecters"
                                : null,
                        onSaved: (input) =>
                            SharedPrefServices.setpasswordtwo(input!),
                      )),
                  const SizedBox(height: 5.0),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colours.kbuttonpurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text('Change Password',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))),
                        onPressed: () async {
                          if (_passwprdonecontroller.text.isEmpty ||
                              _passwprdtwocontroller.text.isEmpty || currentPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please fill the mandatory fields'),
                              ),
                            );
                            return;
                          }

                          String? storedPassword =
                              await SharedPrefServices.getpassword();
                          if (currentPasswordController.text.isEmpty ||
                              currentPasswordController.text !=
                                  storedPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Old password is incorrect'),
                              ),
                            );
                            return;
                          }

                          if (currentPasswordController.text ==
                              _passwprdonecontroller.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'New password cannot be same as old password'),
                              ),
                            );
                            return;
                          }

                          if (_pass.length >= 8 &&
                              _pass.length <= 15 &&
                              _pass.contains(RegExp(r'[A-Z]')) &&
                              _pass.contains(RegExp(r'[a-z]')) &&
                              _pass.contains(RegExp(r'[0-9]')) &&
                              _pass.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
                              _passwprdonecontroller.text.toString().trim() ==
                                  _passwprdtwocontroller.text
                                      .toString()
                                      .trim()) {
                            setState(() {
                              SharedPrefServices.setpassword(
                                  _passwprdonecontroller.text
                                      .toString()
                                      .trim());

                              isApiCallProcess = true;
                              requestmodel.userId =
                                  SharedPrefServices.getuserId().toString();
                              requestmodel.password =
                                  SharedPrefServices.getpassword().toString();
                              ApiService apiService = ApiService();

                              apiService
                                  .changePassword(requestmodel)
                                  .then((value) {
                                if (value.status == 203) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                } else if (value.status == 401) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  ;
                                } else if (value.status == 400) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  ;
                                } else if (value.status == 404) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                } else if (value.status == 200 ||
                                    value.status == 201) {
                                  showToast("Password Updated  Successfully ");

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const LoginScreen();
                                      },
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                }
                              });
                            });
                          } else {
                            setState(() {
                              isApiCallProcess = false;
                            });
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Password mismatch. Please try again.',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colours.kbuttonpurple,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ]));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Password is not matching!')));
                          }
                        },
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
