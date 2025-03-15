import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/theme/app_colors.dart';
import 'package:tkc/utils/assets.dart';

class RevenuCard extends StatelessWidget {
  final Color cardColor;
  final String revenu;
  final String revenuType;
  const RevenuCard({
    super.key,
    required this.cardColor,
    required this.revenu,
    required this.revenuType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.revenuIcon,
                    width: 10,
                    height: 25,
                  ),
                ],
              ),
              AppText(
                  text: '\u{20B9} $revenu',
                  color: AppColors.background,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 5,
              ),
              AppText(
                  text: revenuType,
                  color: AppColors.background,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
      ),
    );
  }
}
