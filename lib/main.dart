import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/videos/repositories/video_playback_config_repo.dart';
import 'package:tiktong/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktong/firebase_options.dart';
import 'package:tiktong/generated/l10n.dart';
import 'package:tiktong/router.dart';
import 'package:tiktong/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 화면 Portrait로 고정
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 시스템 UI(배터리,시간,...) 색상전환
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  final preferences = await SharedPreferences.getInstance();
  final repository = VideoPlaybackConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        playbackConfigProvider.overrideWith(
          () => PlaybackConfigViewModel(repository),
        ),
      ],
      child: TikTongApp(),
    ),
  );
}

class TikTongApp extends StatelessWidget {
  const TikTongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'TikTong',
      locale: Locale("ko"),
      // 시스템 locale 설정 - WidgetsBinding.instance.platformDispatcher.locale
      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("ko")],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: Typography.blackMountainView,
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
          primary: Color(0xFFE9435A),
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
        colorScheme: ColorScheme.fromSeed(
          primary: Color(0xFFE9435A),
          brightness: Brightness.dark,
          seedColor: Colors.black,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: Colors.black,
          color: isDarkMode(context) ? Colors.black : Colors.white,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
