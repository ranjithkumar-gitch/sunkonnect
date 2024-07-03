import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sunkonnect/loginflow/loginpage.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/sidemenu/myprofilepage.dart';
import 'package:sunkonnect/sidemenu/accountsettings.dart';
import 'package:sunkonnect/sidemenu/changepassword.dart';
import 'package:sunkonnect/sidemenu/contactus.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:quickalert/quickalert.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                SizedBox(
                    height: 60,
                    child: Image(
                      image: AssetImage(
                        'assets/sunlogo.png',
                      ),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: 'Konnect @ Sun Kpo',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
              ],
            ),
          ),

          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.black,
              size: 20,
            ),
            title: const CustomText(
                text: 'My Profile',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.black,
              size: 20,
            ),
            title: const CustomText(
                text: 'Email Preferences',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountSettings()),
              );
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.password,
              color: Colors.black,
              size: 20,
            ),
            title: const CustomText(
                text: 'Change Password',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangePassword()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.headphones,
              color: Colors.black,
              size: 20,
            ),
            title: const CustomText(
                text: 'Contact Us',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUS()),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: const Center(
                        child: CustomText(
                            text: 'Are you sure want to logout ?',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            textcolor: Colors.black)),
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colours.kbuttonpurple,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colours.kbuttonpurple,
                                      ),
                                    ))),
                            SizedBox(
                                child: ElevatedButton(
                                    onPressed: () {
                                      SharedPrefServices
                                          .clearUserFromSharedPrefs();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colours.kbuttonpurple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    child: const Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )))
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
                size: 20,
              ),
              title: CustomText(
                  text: 'Log Out',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textcolor: Colors.black),
            ),
          ),

// Quick Alert Type
      //     ListTile(
      //       onTap: () => QuickAlert.show(
      //        animType: QuickAlertAnimType.slideInDown,
      //         onConfirmBtnTap: () {
      //           SharedPrefServices.clearUserFromSharedPrefs();
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => const LoginScreen(),
      //             ),
      //           );
      //         },
      //         onCancelBtnTap: () {
      //            Navigator.pop(context);
      //         },
      //         context: context,
              
      //         type: QuickAlertType.confirm,
      //         text: 'Do you want to logout',
      //         confirmBtnText: 'Yes',
      //         cancelBtnText: 'No',
      //         confirmBtnColor: Colours.kbuttonpurple,
      //       ),
      //       leading: const Icon(
      //         Icons.logout,
      //         color: Colors.black,
      //         size: 20,
      //       ),
      //       title: const CustomText(
      //           text: 'Log Out',
      //           fontSize: 16,
      //           fontWeight: FontWeight.w500,
      //           textcolor: Colors.black),
      //     ),

    
        ],
      ),
    );
  }
}
