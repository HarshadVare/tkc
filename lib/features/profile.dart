import 'package:flutter/material.dart';
import 'package:tkc/theme/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Text('Profile'),
    );
  }
}
