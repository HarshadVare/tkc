import 'package:flutter/material.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/theme/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CommonButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.background, // Text Color
            backgroundColor: AppColors.buttonColor, // Button Background Color
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: AppText(
              text: text,
              color: AppColors.background,
              fontSize: 14,
              fontWeight: FontWeight.w400)),
    );
  }
}
