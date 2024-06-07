import 'package:flutter/material.dart';
import 'package:sunkonnect/sharedprefences.dart';
import 'package:sunkonnect/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

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
