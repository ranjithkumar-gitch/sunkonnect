import 'package:flutter/material.dart';
import 'package:sunkonnect/editprofilepage.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.orange,
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/profile.webp')),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "First Name",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.person,
                  text: "Ranjith",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "Last Name",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.person,
                  text: "Kumar",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "Designation",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.work,
                  text: "Developer",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "Employee Id",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.description,
                  text: "SUN1234567",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "Phone Number",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.phone,
                  text: "+1 (913) 312-5713",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomText(
                    text: "Email",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black),
                const SizedBox(
                  height: 5.0,
                ),
                CustomViewText(
                  geticon: Icons.email,
                  text: "ranjith@sunkpo.com",
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: CustomButton(
                        text: "Edit Profile",
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                          // updateProfile();
                        },
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
