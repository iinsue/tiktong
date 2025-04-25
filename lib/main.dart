import 'package:flutter/material.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTongApp());
}

class TikTongApp extends StatelessWidget {
  const TikTongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE9435A),
          brightness: Brightness.light,
        ).copyWith(primary: Color(0xFFE9435A)),
      ),
      home: SignUpScreen(),
    );
  }
}
