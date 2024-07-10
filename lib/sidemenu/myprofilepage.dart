import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/sidemenu/editprofilepage.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'My Profile'),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      //   child: CustomButton(
      //       text: "Edit Profile",
      //       textColor: Colors.white,
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => EditProfilePage()),
      //         );
      //         // updateProfile();
      //       },
      //       color: Colours.kbuttonpurple,
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(
                height: 40.0,
              ),
              const Center(
                child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/profile.webp')),
              ),
          
              const SizedBox(
                height: 50.0,
              ),
          
               Text('Full Name',style: GoogleFonts.poppins(fontSize: 13,color: Colours.korange),),
              
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colours.korange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                      text: "${SharedPrefServices.getname()}",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 2.0,
                thickness: 1.0,
                color: Colours.kbordergrey,
              ),
              const SizedBox(
                height: 10.0,
              ),
          
              const SizedBox(
                height: 10.0,
              ),
               Text('Email',style: GoogleFonts.poppins(fontSize: 13,color: Colours.korange),),
              
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.mail,
                    color: Colours.korange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                      text: "${SharedPrefServices.getuserId()}",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 2.0,
                thickness: 1.0,
                color: Colours.kbordergrey,
              ),
              const SizedBox(
                height: 10.0,
              ),
          
              const SizedBox(
                height: 10.0,
              ),
               Text('Role',style: GoogleFonts.poppins(fontSize: 13,color: Colours.korange),),
              
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.manage_accounts,
                    color: Colours.korange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                      text: "${SharedPrefServices.getroleCode()}",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 2.0,
                thickness: 1.0,
                color: Colours.kbordergrey,
              ),
              const SizedBox(
                height: 10.0,
              ),
          
              const SizedBox(
                height: 10.0,
              ),
              Text('Designation',style: GoogleFonts.poppins(fontSize: 13,color: Colours.korange),),
              
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.work,
                    color: Colours.korange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                      text: "${SharedPrefServices.getroleDescription()}",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 2.0,
                thickness: 1.0,
                color: Colours.kbordergrey,
              ),
              const SizedBox(
                height: 10.0,
              ),
          
          
               const SizedBox(
                height: 10.0,
              ),
              Text('Account Status',style: GoogleFonts.poppins(fontSize: 13,color: Colours.korange),),
              
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colours.korange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                      text: "${SharedPrefServices.getstatus()}",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 2.0,
                thickness: 1.0,
                color: Colours.kbordergrey,
              ),
              const SizedBox(
                height: 10.0,
              ),
          
              
             
            ],
          ),
        ),
      ),
    );
  }
}

                      // Center(
                //     child: CustomButton(
                //         text: "Edit Profile",
                //         textColor: Colors.white,
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => EditProfilePage()),
                //           );
                //           // updateProfile();
                //         },
                //         color: Colours.kbuttonpurple,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600)),
