import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';


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

 
  bool currentPassword = true;  bool newPassword = true; bool confirmPassword = true;

   TextEditingController currentPasswordController =   TextEditingController(); 
  TextEditingController newPasswordController =   TextEditingController(); 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
   appBar: const CustomAppbar(title: 'Change Password'),
     body: Container(
     margin: const EdgeInsets.only(right: 10,left: 10),
     child: SingleChildScrollView(
       child: Form(
        key: _formKey,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [ 
            const  SizedBox(height: 10,),
              
            Center(
              child: Card( elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color(0XffF6F7F7),
              child: Container(
                height: 60,width: 60,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0XffF6F7F7),),
               child: const Center(
                child: Icon(Icons.password,color: Colours.kbuttonpurple,size: 30,)
               ),
              ),
              ),
            ),
          
        
         const  SizedBox(height: 10,),
         Text(' Email',style: GoogleFonts.poppins( fontSize: 12,fontWeight: FontWeight.w500, color: Colours.ksubheadertext, ),),
                  
                  
                    const SizedBox(
                      height: 10,
                    ),
     
                    SizedBox(
                        height: 70,
                        child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 12, 10, 15),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Colours.kbordergrey,),
                              ),
                              prefixIcon: const Padding(
                                padding:  EdgeInsets.fromLTRB(12, 10, 10, 10),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ), 
                      
                            hintText: "Email",
                             hintStyle: const TextStyle( fontSize: 13, fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colours.kbordergrey,
                                  width: 1.0,
                                ),
                              ),
                            ))),
                  const SizedBox(
                        height: 10,),
     
                         Text(' Old Password',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, color: Colours.ksubheadertext, ),),   
                        //  fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black
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
                                borderSide: const BorderSide(color: Colours.kbordergrey,),
                              ),
                              prefixIcon:const  Padding(
                                padding:  EdgeInsets.fromLTRB(12, 10, 10, 10),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ), 
                        
                   suffixIcon: currentPasswordController.text.isNotEmpty
                   ? (currentPasswordController.text == ''
                   ? const Icon(
                       Icons.check_circle,
                  color: Colors.green, size: 18,
                 )
               : const Icon(
              Icons.cancel,
                color: Colors.red,size: 18,
                 ))
               : const  Icon(
            Icons.remove_red_eye,
             color: Colors.grey,size: 18,
                  ),
        
                            hintText: "Old Password",
                             hintStyle: const TextStyle( fontSize: 13, fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colours.kbordergrey,
                                  width: 1.0,
                                ),
                              ),
                            ))),
     
                      const SizedBox(height: 10,),
     
                   Text(' New Password',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, color: Colours.ksubheadertext, ),),
                      
                    const SizedBox(
                      height: 10,
                    ), 
                               SizedBox(
                                height: 70,
                                child: TextFormField(
                                    controller: newPasswordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: newPassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter New  Password";
                                      } else if (!_isValidPassword(value)) {
                                        return "Password must be at least 7 characters, along special ,numeric , one Uppercase ";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          12, 10, 10, 10),
                                      prefixIcon:  const Padding(
                                        padding:
                                             EdgeInsets.fromLTRB(12, 10, 10, 10),
                                        child: Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              newPassword = !newPassword;
                                            });
                                          },
                                          icon: newPassword
                                              ? (const Icon(
                                                  Icons.visibility_off,
                                                  color: Colors.grey, size: 18,
                                                ))
                                              :  const Icon(
                                                  Icons.visibility,
                                                  color: Colors.grey,size: 18,
                                                )),
                                      hintText: "New Password",
                                       hintStyle:const TextStyle( fontSize: 13, fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const  BorderSide(
                                              color: Colours.kbordergrey,)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                    )),
                              ),
                    
            
                            const SizedBox(height: 10,),
     
               Text(' Confirm Password',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, color: Colours.ksubheadertext, ),),
          
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 70,
                        child: TextFormField(
                          obscureText: confirmPassword,
                           validator: (value) {
                             if (value!.isEmpty) {
                              return "Please Confirm New  Password";
                             } else if (!_isValidPassword(value)) {
                      return "Password must be at least 7 characters, with at least one uppercase letter, one numeric digit, and one special character";
                                } else if (value !=
                            newPasswordController.text) {
                              return "Passwords do not match";
                                      }
                                      return null;
                                    },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 10, 10, 10),
                              
                              prefixIcon:  const Padding(
                                padding:  EdgeInsets.fromLTRB(12, 12, 10, 15),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ),
                               suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    confirmPassword = !confirmPassword;
                                  });
                                },
                                icon: confirmPassword
                                    ? (const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,size: 18,
                                      ))
                                    :  const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,size: 18,
                                      )),
                            hintText: "Confirm Password",
                            hintStyle:const TextStyle( fontSize: 13, fontWeight: FontWeight.w400),
                             border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colours.kbordergrey,)),
                            ))),
            
                          const SizedBox(height: 10,),
     
                            SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                         style: ElevatedButton.styleFrom(backgroundColor: Colours.kbuttonpurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: Text('Change Password',style: GoogleFonts.poppins( textStyle: const TextStyle(color: Colors.white,fontFamily: 'poppins',fontSize: 15,   fontWeight:FontWeight.w500,))),
                       onPressed: () async {
                  
                       }
     )),
           ],
         ),
       ),
     ),
     )

    );
  }  

  
  

  
}


  
   