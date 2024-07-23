
import 'package:flutter/material.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:sunkonnect/widgets/header.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  bool isSwitch = false; 

  @override
  void initState() {
    super.initState();
    SharedPrefServices.getemailFlag();
    print(SharedPrefServices.getemailFlag());
      button();
  }
  

  Future<void> button() async {
    bool? emailFlag = await SharedPrefServices.getemailFlag();
    setState(() {
      isSwitch = emailFlag!;
    });
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
                    Row(
                      children: [
                      
                   Radio(
                    activeColor: Colours.kbuttonpurple,
                    value: true,
                    groupValue: isSwitch,
                    onChanged: (value) {
                      
                    },
                  ),
                       
                        
                        const CustomText(
                          text: 'Subscribe to all emails',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textcolor: Colors.black,
                        ),
                      ],
                    ),

                    
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 40),

                    // imp //
                     // AdvancedSwitch(
                  //         width: 55,
                  //         height: 25,
                  //         initialValue: isSwitch,
                  //         activeColor: Colours.kbuttonpurple,
                  //         inactiveColor: Colours.kbuttonpurple,
                  //         enabled: false,
                  //         onChanged: (value) {
                            
                  //         },
                  //       ),   

                 
            ],
          ),
        ),
      ),
    );
  }
}




//   updateRolecode(){
//     setState(() {
//       SharedPrefServices.getemailFlag() == false ? SharedPrefServices.setemailFlag(true) : SharedPrefServices.setemailFlag(false);
// });
// }

// at the momment commented code //
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       SizedBox(
      //           height: 40,
      //           width: 100,
      //           child: OutlinedButton(
      //               onPressed: () {},
      //               style: OutlinedButton.styleFrom(
      //                 side: const BorderSide(
      //                   color: Colours.kbuttonpurple,
      //                 ),
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //               ),
      //               child: const CustomText(
      //                   text: 'Cancel',
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w600,
      //                   textcolor: Colours.kbuttonpurple))),
      //       SizedBox(
      //         height: 40,
      //         width: 100,
      //         child: ElevatedButton(
      //             onPressed: () {},
      //             style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colours.kbuttonpurple,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10))),
      //             child: const CustomText(
      //                 text: 'Save',
      //                 fontSize: 14,
      //                 fontWeight: FontWeight.w600,
      //                 textcolor: Colors.white)),
      //       )
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

// this code for dailog box in onchanged toggle  //    setState(() {
//      isSubscribed = value;
//      if (isSubscribed) {
//         showDialog(
//          barrierDismissible: false,
//  context: context,
//  builder: (BuildContext context) {
//    return AlertDialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(15)),
//      title: const Center(
//          child: CustomText(
//              text: 'Are you sure you want to subscribe to emails?',
//              fontSize: 15,
//              fontWeight: FontWeight.w500,
//              textcolor: Colors.black)),
//      actions: [
//        Container(
//          margin: const EdgeInsets.only(right: 25, left: 25),
//          child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              SizedBox(

//                  child: ElevatedButton(
//                      onPressed: () {
//                        Navigator.pop(context);
//                      },
//                      style: ElevatedButton.styleFrom(
//                        backgroundColor: Colors.green,
//                        shape: RoundedRectangleBorder(
//                            borderRadius:
//                                BorderRadius.circular(10)),
//                      ),
//                      child: const Text(
//                        "YES",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 15,
//                            fontWeight: FontWeight.w500),
//                      ))),
//                      SizedBox(

//                  child: ElevatedButton(
//                      onPressed: () {
//                         Navigator.pop(context);
//                      },
//                      style: ElevatedButton.styleFrom(
//                        backgroundColor: Colours.backbuttonColor,
//                        shape: RoundedRectangleBorder(
//                            borderRadius:
//                                BorderRadius.circular(10)),
//                      ),
//                      child: const Text(
//                        "NO",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 15,
//                            fontWeight: FontWeight.w500),
//                      )))

//            ],
//          ),
//        )
//      ],
//    );
//      });
//  }});

// updateRolecode(){
//     setState(() {
//       SharedPrefServices.getstatus() == false ? SharedPrefServices.setstatus(true) : SharedPrefServices.setstatus(false);
//          SharedPrefServices.getroleCode().toString() == 'company' ? SharedPrefServices.setroleCode('customer')
//       : SharedPrefServices.getroleCode().toString() == 'customer' ? SharedPrefServices.setroleCode('company') : SharedPrefServices.setroleCode('company');
//         });

//  