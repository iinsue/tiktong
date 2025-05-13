import 'package:go_router/go_router.dart';
import 'package:tiktong/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktong/features/authentication/login_screen.dart';
import 'package:tiktong/features/authentication/sign_up_screen.dart';
import 'package:tiktong/features/onboarding/interests_screen.dart';

final router = GoRouter(
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
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
  ],
);
