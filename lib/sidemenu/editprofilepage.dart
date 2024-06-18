import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

 File? image;
  TextEditingController firstnameController = TextEditingController(text: SharedPrefServices.getname().toString());

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}


 @override
  void dispose() {
    firstnameController.dispose();
    super.dispose();
  }
    
 Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }

  return image;
}


    void selectImage() async {
    image = await pickImage(context);
    setState(() {
      image = File(image!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'Edit Profile'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        child: CustomButton(
            text: "Update Profile",
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              // updateProfile();
            },
            color: Colours.kbuttonpurple,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.only(right: 15,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40.0,
              ),

               Center(
                  child: Stack(clipBehavior: Clip.none, children: [
                    image == null
                        ? const CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage('assets/profile.webp')
                          )
                        : CircleAvatar(
                            radius: 55,
                            backgroundImage: FileImage(image!),
                          ),
                    Positioned(
                        top: 65,
                        left: 85,
                        child: GestureDetector(
                          onTap: () => selectImage(),
                          child: const CircleAvatar(
                              backgroundColor: Colours.korange,
                              radius: 18,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 18,
                              )),
                        )),
                  ]),
                ),
              // const Center(
              //   child: CircleAvatar(
              //       radius: 50.0,
              //       backgroundImage: AssetImage('assets/profile.webp')),
              // ),
          
              const SizedBox(
                height: 30.0,
              ),
              
              const CustomText(
                text: "Full Name",
                fontSize: 13,
                fontWeight: FontWeight.w500,
                textcolor: Colours.korange,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      controller: firstnameController,
                      style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 8, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colours.kbordergrey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 12, 10, 15),
                      child: Icon(
                        Icons.person,
                        color: Colours.korange,
                        size: 20,
                      ),
                    ),
                  
                    suffixIcon:
                        const Icon(Icons.edit, size: 20, color: Colours.korange),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colours.kbordergrey,
                        width: 1.0,
                      ),
                    ),
                  ))),

              const SizedBox(
                height: 10,
              ),

              const CustomText(
                  text: "Email",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textcolor: Colours.korange,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colours.kbordergrey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colours.korange,
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
                height: 10,
              ),

              const CustomText(
                  text: "Role",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textcolor: Colours.korange,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colours.kbordergrey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.manage_accounts,
                          color: Colours.korange,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                            text: SharedPrefServices.getroleCode().toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textcolor: Colors.black)
                      ],
                    ),
                  ),
                ),


                const SizedBox(
                height: 10,
              ),

              const CustomText(
                  text: "Designation",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textcolor: Colours.korange,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colours.kbordergrey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.work,
                          color: Colours.korange,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                            text: SharedPrefServices.getroleDescription().toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textcolor: Colors.black)
                      ],
                    ),
                  ),
                ),


                const SizedBox(
                height: 10,
              ),

              const CustomText(
                  text: "Account Status",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textcolor: Colours.korange,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colours.kbordergrey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colours.korange,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                            text: SharedPrefServices.getstatus().toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textcolor: Colors.black)
                      ],
                    ),
                  ),
                ),
              
              const SizedBox(
                height: 100,
              ),
             
              
            ],
          ),
        ),
      ),
    );
  }
}
