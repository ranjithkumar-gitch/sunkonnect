import 'package:flutter/material.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image(image: AssetImage('assets/LOGO.png')),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Connect@SunKpo',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              'User Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
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
                      Icons.email_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  // suffixIcon:
                  //     const Icon(Icons.edit, size: 18, color: Colors.black),
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
              text: "Password",
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
                    obscureText: true,
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
                          Icons.password,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      // suffixIcon:
                      //     const Icon(Icons.edit, size: 18, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ))),
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // TextFormField(
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 20.0),
            Center(
                child: CustomButton(
                    text: "Login",
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                      // updateProfile();
                    },
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
