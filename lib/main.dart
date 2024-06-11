import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
   await SharedPrefServices.init(); 
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme:
       GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(),
       useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
