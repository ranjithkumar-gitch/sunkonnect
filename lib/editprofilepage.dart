import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "First Name",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Last Name",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Designation",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.work,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Employee Id",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.description,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Phone Number",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Email",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: TextFormField(
                      // controller: qualifiedController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 10, 15),
                      child: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    suffixIcon:
                        const Icon(Icons.edit, size: 18, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ))),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  text: "UPDATE",
                  textColor: Colors.white,
                  onPressed: () {
                    // updateProfile();
                  },
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
      ),
    );
  }
}
