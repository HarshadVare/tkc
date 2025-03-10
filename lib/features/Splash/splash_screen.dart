import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkc/features/Login/presentation/cubit/login_cubit.dart';
import 'package:tkc/config/app_router.dart';
import 'package:tkc/config/app_router_constatnt.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().checkAuthStatus(); // Check authentication state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is Authenticated) {
              AppRouter.pushReplacement(AppRouterConstatnt.mainScreen, context);
            } else if (state is Unauthenticated) {
              AppRouter.pushReplacement(
                  AppRouterConstatnt.loginSCreen, context);
            }
          },
          child: CircularProgressIndicator(), // Show loader while checking auth
        ),
      ),
    );
  }
}
