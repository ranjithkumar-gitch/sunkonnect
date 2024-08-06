import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/loginflow/model/email_flag_request_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/header.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  bool isSwitch = false;
  late EmailFlagupdateRequestModel requestmodel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    _loadInitialSwitchState();
    requestmodel = EmailFlagupdateRequestModel(f_sendEmails: 'true', userId: SharedPrefServices.getuserId().toString()); 
  }

  Future<void> _loadInitialSwitchState() async {
    bool? emailFlag = await SharedPrefServices.getemailFlag();
    setState(() {
      isSwitch = emailFlag ?? false;
    });
  }

  Future<void> _showConfirmationDialog(bool value) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CustomText(
            text: value ? 'Are you sure you want to subscribe to emails?' : 'Are you sure you want to unsubscribe from emails?',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            textcolor: Colors.black,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        isSwitch = !value; 
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.backbuttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "NO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                     

                     
                      requestmodel.f_sendEmails = value.toString();
                   
                       print(requestmodel);
                       inspect(requestmodel);
                       
                      setState(() {
                        isApiCallProcess = true;
                      });

                      try {
                        ApiService apiService = ApiService();
                        var response = await apiService.emailFlagUpdate(requestmodel);
                       print('Now Printing response ');
                       print(response.status);
                       inspect(response);

                        if (response.status == 200 || response.status == 201) {
                          showToast("EmailFlag Updated Successfully");
                          SharedPrefServices.setemailFlag(value);
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>  DashboardScreen()));
                        } else {
                          showToast("Failed to update email");
                        }
                      } catch (error) {
                        print("Error updating email flag: $error");
                        showToast("An error occurred");
                      } finally {
                        setState(() {
                          isApiCallProcess = false;
                        });
                      }
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "YES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'Account Settings'),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Header(title: 'Email Notifications'),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.kbordergrey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colours.kwhiteColor,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Container(
                      margin: const EdgeInsets.only(left: 10,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          const CustomText(
                            text: 'Subscribe to all emails',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textcolor: Colors.black,
                          ),
                           Row(
                             children: [
                              const CustomText(text: 'OFF', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colours.kbuttonpurple),
                               Switch(
                                activeTrackColor: Colors.grey.shade300,
                                inactiveTrackColor: Colors.grey.shade300,
                                value: isSwitch,
                                activeColor: Colors.green,
                                inactiveThumbColor: Colors.red,
                                onChanged: (value) {
                                  _showConfirmationDialog(value);
                                },
                                 ),
                           const CustomText(text: 'ON', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colours.kbuttonpurple),
                      
                             ],
                           ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

  


//                         //  Radio(
//                         //   activeColor: Colours.kbuttonpurple,
//                         //   value: true,
//                         //   groupValue: isSwitch,
//                         //   onChanged: (value) {

//                         //   },
//                         // ),



                   

//                      // imp //
//                      // AdvancedSwitch(
//                   //         width: 55,
//                   //         height: 25,
//                   //         initialValue: isSwitch,
//                   //         activeColor: Colours.kbuttonpurple,
//                   //         inactiveColor: Colours.kbuttonpurple,
//                   //         enabled: false,
//                   //         onChanged: (value) {
                            
//                   //         },
//                   //       ),   


// //   updateRolecode(){
// //     setState(() {
// //       SharedPrefServices.getemailFlag() == false ? SharedPrefServices.setemailFlag(true) : SharedPrefServices.setemailFlag(false);
// // });
// // }

// // at the momment commented code //
//       // floatingActionButton: Padding(
//       //   padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
//       //   child: Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //     children: [
//       //       SizedBox(
//       //           height: 40,
//       //           width: 100,
//       //           child: OutlinedButton(
//       //               onPressed: () {},
//       //               style: OutlinedButton.styleFrom(
//       //                 side: const BorderSide(
//       //                   color: Colours.kbuttonpurple,
//       //                 ),
//       //                 shape: RoundedRectangleBorder(
//       //                     borderRadius: BorderRadius.circular(10)),
//       //               ),
//       //               child: const CustomText(
//       //                   text: 'Cancel',
//       //                   fontSize: 14,
//       //                   fontWeight: FontWeight.w600,
//       //                   textcolor: Colours.kbuttonpurple))),
//       //       SizedBox(
//       //         height: 40,
//       //         width: 100,
//       //         child: ElevatedButton(
//       //             onPressed: () {},
//       //             style: ElevatedButton.styleFrom(
//       //                 backgroundColor: Colours.kbuttonpurple,
//       //                 shape: RoundedRectangleBorder(
//       //                     borderRadius: BorderRadius.circular(10))),
//       //             child: const CustomText(
//       //                 text: 'Save',
//       //                 fontSize: 14,
//       //                 fontWeight: FontWeight.w600,
//       //                 textcolor: Colors.white)),
//       //       )
//       //     ],
//       //   ),
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

// // this code for dailog box in onchanged toggle  //    setState(() {
// //      isSubscribed = value;
// //      if (isSubscribed) {
// //         showDialog(
// //          barrierDismissible: false,
// //  context: context,
// //  builder: (BuildContext context) {
// //    return AlertDialog(
// //      shape: RoundedRectangleBorder(
// //          borderRadius: BorderRadius.circular(15)),
// //      title: const Center(
// //          child: CustomText(
// //              text: 'Are you sure you want to subscribe to emails?',
// //              fontSize: 15,
// //              fontWeight: FontWeight.w500,
// //              textcolor: Colors.black)),
// //      actions: [
// //        Container(
// //          margin: const EdgeInsets.only(right: 25, left: 25),
// //          child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //            children: [
// //              SizedBox(

// //                  child: ElevatedButton(
// //                      onPressed: () {
// //                        Navigator.pop(context);
// //                      },
// //                      style: ElevatedButton.styleFrom(
// //                        backgroundColor: Colors.green,
// //                        shape: RoundedRectangleBorder(
// //                            borderRadius:
// //                                BorderRadius.circular(10)),
// //                      ),
// //                      child: const Text(
// //                        "YES",
// //                        style: TextStyle(
// //                            color: Colors.white,
// //                            fontSize: 15,
// //                            fontWeight: FontWeight.w500),
// //                      ))),
// //                      SizedBox(

// //                  child: ElevatedButton(
// //                      onPressed: () {
// //                         Navigator.pop(context);
// //                      },
// //                      style: ElevatedButton.styleFrom(
// //                        backgroundColor: Colours.backbuttonColor,
// //                        shape: RoundedRectangleBorder(
// //                            borderRadius:
// //                                BorderRadius.circular(10)),
// //                      ),
// //                      child: const Text(
// //                        "NO",
// //                        style: TextStyle(
// //                            color: Colors.white,
// //                            fontSize: 15,
// //                            fontWeight: FontWeight.w500),
// //                      )))

// //            ],
// //          ),
// //        )
// //      ],
// //    );
// //      });
// //  }});

// // updateRolecode(){
// //     setState(() {
// //       SharedPrefServices.getstatus() == false ? SharedPrefServices.setstatus(true) : SharedPrefServices.setstatus(false);
// //          SharedPrefServices.getroleCode().toString() == 'company' ? SharedPrefServices.setroleCode('customer')
// //       : SharedPrefServices.getroleCode().toString() == 'customer' ? SharedPrefServices.setroleCode('company') : SharedPrefServices.setroleCode('company');
// //         });

// //  




