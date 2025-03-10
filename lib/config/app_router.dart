import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tkc/config/app_router_constatnt.dart';
import 'package:tkc/features/Login/presentation/cubit/login_cubit.dart';
import 'package:tkc/features/Login/presentation/view/login.dart';
import 'package:tkc/features/Splash/splash_screen.dart';
import 'package:tkc/main.dart'; // Service to check auth state

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRouterConstatnt.splashScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouterConstatnt.splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) => LoginCubit()..checkAuthStatus(),
              child: const SplashScreen());
        },
      ),
      GoRoute(
        path: AppRouterConstatnt.loginSCreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouterConstatnt.mainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
      ),
    ],
  );

  static push(String path, BuildContext context, {Map<String, dynamic>? data}) {
    GoRouter.of(context).push(path, extra: data);
  }

  static pushReplacement(String path, BuildContext context,
      {Map<String, dynamic>? data}) {
    GoRouter.of(context).go(path, extra: data);
  }

  static back(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
