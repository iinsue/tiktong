import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/authentication/sign_up_screen.dart';

void main() async {
  // 화면 Portrait로 고정
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 시스템 UI(배터리,시간,...) 색상전환
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(const TikTongApp());
}

class TikTongApp extends StatelessWidget {
  const TikTongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE9435A),
          brightness: Brightness.light,
        ).copyWith(primary: Color(0xFFE9435A)),
      ),
      home: LayoutBuilderCodeLab(),
    );
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width / 2,
        child: LayoutBuilder(
          builder:
              (context, BoxConstraints constraints) => Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "${size.width} / ${constraints.maxWidth}",
                    style: TextStyle(color: Colors.white, fontSize: 98),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
