import 'package:coinbase/pages/homepage.dart';
import 'package:coinbase/utils/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
  Get.put(BalanceController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'Coinbase',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          primarySwatch: const MaterialColor(
            0xFF000000,
            <int, Color>{
              50: Color(0xFFE0E0E0),
              100: Color(0xFFB3B3B3),
              200: Color(0xFF808080),
              300: Color(0xFF4D4D4D),
              400: Color(0xFF262626),
              500: Color(0xFF000000),
              600: Color(0xFF000000),
              700: Color(0xFF000000),
              800: Color(0xFF000000),
              900: Color(0xFF000000),
            },
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
