import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE9435A),
          brightness: Brightness.light,
        ).copyWith(primary: Color(0xFFE9435A)),
      ),
      home: SignUpScreen(),
    );
  }
}
