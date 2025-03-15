import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tkc/config/app_router.dart';
import 'package:tkc/config/app_router_constatnt.dart';
import 'package:tkc/features/AddItem/presentation/view/add_item.dart';
import 'package:tkc/features/Home/presentation/view/home.dart';
import 'package:tkc/features/Login/presentation/cubit/login_cubit.dart';
import 'package:tkc/features/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open a box for token storage
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TKC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}

