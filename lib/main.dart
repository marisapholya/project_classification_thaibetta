import 'package:flutter/material.dart';
import 'package:project_betta/pages/about/aboutcare.dart';
import 'package:project_betta/pages/about/aboutcaredetail.dart';
import 'package:project_betta/pages/about/aboutdisease.dart';
import 'package:project_betta/pages/about/aboutdiseasedetail.dart';
import 'package:project_betta/pages/home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_betta/pages/home/splash.dart';
import 'package:project_betta/pages/typebetta/type.dart';
import 'package:project_betta/pages/typebetta/typedetail.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BETTA FISH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.mitr().fontFamily,
      ),
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        TypeBetta.routeName : (context) => const TypeBetta(),
        TypeDetail.routeName : (context) => const TypeDetail(),
        AboutCare.routeName : (context) => const AboutCare(),
        AboutCareDetail.routeName : (context) => const AboutCareDetail(),
        AboutDisease.routeName : (context) => const AboutDisease(),
        AboutDiseaseDetail.routeName : (context) => const AboutDiseaseDetail(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}