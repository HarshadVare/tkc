import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tkc/config/app_router.dart';
import 'package:tkc/config/app_router_constatnt.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/config/app_text_field.dart';
import 'package:tkc/constants/image_path.dart';
import 'package:tkc/features/Login/presentation/cubit/login_cubit.dart';
import 'package:tkc/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // IconButton(
                        //     onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                        Image.asset(
                          ImagePath.cartLogo,
                          height: 22,
                          width: 22,
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    AppText(
                        text: 'Login',
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    SizedBox(height: 50),
                    AppTextFiled(
                        isSuffixIcon: true,
                        label: "Phone or User ID",
                        controller: _idController,
                        error: "Invalid User ID"),
                    SizedBox(height: 30),
                    AppTextFiled(
                      isSuffixIcon: true,
                      label: "Password",
                      controller: _passwordController,
                      error: "Invalid Password",
                      isPassword: true,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            // Show Toast Message
                            Fluttertoast.showToast(
                              msg: "Login Successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            AppRouter.pushReplacement(
                                AppRouterConstatnt.mainScreen, context);
                          } else if (state is LoginError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.error?.message ??
                                  'Something went wrong'),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        builder: (context, state) {
                          return TextButton(
                            onPressed: state is LoginLoading
                                ? null // Disable button while loading
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginCubit>().login(
                                            username: _idController.text,
                                            password: _passwordController.text,
                                          );
                                    }
                                  },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  AppColors.purple, // Background color
                              foregroundColor: Colors.white, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                            ),
                            child: state is LoginLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('LOGIN'),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: SizedBox(
                    //       height: 45,
                    //       child: AppText(
                    //         text: 'Forgot user ID or password?',
                    //         color: AppColors.blue,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 100,
                    ),
                    // SvgPicture.asset(
                    //   ImagePath.zerodhaLogo,
                    //   color: AppColors.logoColor,
                    //   height: 12,
                    //   width: 12,
                    // ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: AppText(
                          text: "TKC",
                          color: AppColors.blackColor,
                          textDecoration: TextDecoration.underline,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
