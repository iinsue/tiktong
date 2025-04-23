import 'package:flutter/material.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE9435A)),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Tik Tong")),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size14),
          child: Row(children: const [Text("Hello"), Gaps.h20, Text("Hello")]),
        ),
      ),
    );
  }
}
