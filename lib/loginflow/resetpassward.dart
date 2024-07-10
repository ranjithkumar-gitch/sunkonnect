import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/loginflow/loginpage.dart';
import 'package:sunkonnect/loginflow/model/password_update_request_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/password_checker.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class Resetpassward extends StatefulWidget {
  const Resetpassward({super.key});

  @override
  State<Resetpassward> createState() => _ResetpasswardState();
}

class _ResetpasswardState extends State<Resetpassward> {
  bool _isValidPassword(String password) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$');
    return regex.hasMatch(password);
  }

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  String _pass = "";

  bool isApiCallProcess = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  final _passwprdonecontroller = TextEditingController();
  final _passwprdtwocontroller = TextEditingController();

  bool _passwordVisibleone = false;
  bool _passwordVisibletwo = false;

  late Passwordupdaterequestmodel requestmodel;

  @override
  void initState() {
    super.initState();

    requestmodel = new Passwordupdaterequestmodel(
      userId: '',
      password: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(backgroundColor: Colors.orange,),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFFFFFF), Color(0xff808080)])),
          ),
          Container(
            margin: const EdgeInsets.only(top: 250.0),
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/sunkpo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: Card(
                child: Wrap(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20.0),
                          const Text(
                            "Create password",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 23.0, right: 23.0),
                            child: const Text(
                              "* Create password for your account so you can login and access all the features.",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          Card(
                            margin:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xffCCCCCC),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffFFF7F7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(15),
                                ],
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _pass = value;
                                    print(_pass);
                                  });
                                },
                                controller: _passwprdonecontroller,
                                obscureText: !_passwordVisibleone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      // #FFF7F7
                                    ),
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "New Password",
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Color(0xff979797),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisibleone
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xff979797),
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisibleone =
                                            !_passwordVisibleone;
                                      });
                                    },
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xff979797),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                validator: (input) => input!.length <= 7
                                    ? "Atleast Eight charecters"
                                    : null,
                                onSaved: (input) =>
                                    SharedPrefServices.setpassword(input!),
                              ),
                            ),
                          ),
                          ///////////////////////
                          const SizedBox(height: 10.0),
                          Card(
                            margin:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xffCCCCCC),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffFFF7F7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                  ],
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  controller: _passwprdtwocontroller,
                                  obscureText: !_passwordVisibletwo,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        // #FFF7F7
                                      ),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: "Confirm Password",
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xff979797),
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
                                          _passwordVisibletwo =
                                              !_passwordVisibletwo;
                                        });
                                      },
                                    ),
                                    hintStyle: const TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff979797),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  validator: (input) =>
                                      input == _passwprdonecontroller.text
                                          ? "Atleast six charecters"
                                          : null,
                                  onSaved: (input) =>
                                      SharedPrefServices.setpasswordtwo(
                                          input!)),
                            ),
                          ),
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
                          const SizedBox(height: 45.0),
                          Container(
                            width: double.infinity,
                            height: 48.0,
                            margin:
                                const EdgeInsets.only(left: 37.0, right: 37.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colours.kbuttonpurple),
                              child: const Text(
                                "Change Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () async {
                                if (_passwprdonecontroller.text.isEmpty ||
                       _passwprdtwocontroller.text.isEmpty) {
                        
                         ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(
                       content: Text('Please fill the mandatory fields'),
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
                                    _passwprdonecontroller.text
                                            .toString()
                                            .trim() ==
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
                                        SharedPrefServices.getuserId()
                                            .toString();
                                    requestmodel.password =
                                        SharedPrefServices.getpassword()
                                            .toString();
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
                                         ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                       content: Text('UserId Not Matched With Records'),
                                        ),
                                        );
                                      
                                      
                                      } else if (value.status == 200 ||
                                          value.status == 201) {
                                        showToast(
                                            "Password Updated  Successfully ");
                                        
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
                                                    Navigator.pop(
                                                        context, false);
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color:
                                                          Colours.kbuttonpurple,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ]));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Password is not matching!')));
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
