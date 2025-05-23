import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktong/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktong/features/authentication/login_screen.dart';
import 'package:tiktong/features/authentication/repositories/authentication_repo.dart';
import 'package:tiktong/features/authentication/sign_up_screen.dart';
import 'package:tiktong/features/inbox/activity_screen.dart';
import 'package:tiktong/features/inbox/chat_detail_screen.dart';
import 'package:tiktong/features/inbox/chats_screen.dart';
import 'package:tiktong/features/onboarding/interests_screen.dart';
import 'package:tiktong/features/videos/views/video_recording_screen.dart';

final routerProvider = Provider((ref) {
  // 이렇게 router에 직접 넣으면 자동으로 rebuild 되면서 로그인 상태를 알려줍니다.
  //ref.watch(authState);

  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },

    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => SignUpScreen(),
      ),

      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeURL,
        builder: (context, state) => InterestsScreen(),
      ),

      GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/:tab(home|discover|inbox|profile)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),

      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeURL,
        builder: (context, state) => ActivityScreen(),
      ),

      GoRoute(
        name: ChatsScreen.routeName,
        path: ChatsScreen.routeURL,
        builder: (context, state) => ChatsScreen(),
        routes: [
          GoRoute(
            name: ChatDetailScreen.routeName,
            path: ChatDetailScreen.routeURL,
            builder: (context, state) {
              final chatId = state.pathParameters["chatId"]!;
              return ChatDetailScreen(chatId: chatId);
            },
          ),
        ],
      ),

      GoRoute(
        name: VideoRecordingScreen.routeName,
        path: VideoRecordingScreen.routeURL,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: Duration(milliseconds: 200),
            child: VideoRecordingScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final position = Tween(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(position: position, child: child);
            },
          );
        },
      ),
    ],
  );
});
