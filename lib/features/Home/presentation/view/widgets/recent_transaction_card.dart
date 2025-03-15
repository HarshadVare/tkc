import 'package:flutter/material.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/theme/app_colors.dart';

class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.buttonColor.withOpacity(0.40)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.background,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            padding: EdgeInsets.all(16),
            // height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.background),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: 'Item Name : Biscuit',
                    color: AppColors.recentCardText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 12,
                ),
                AppText(
                    text: 'Quantity : 2',
                    color: AppColors.recentCardText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 12,
                ),
                AppText(
                    text: 'Amount : 10',
                    color: AppColors.recentCardText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 12,
                ),
                AppText(
                    text: 'Status : Success',
                    color: AppColors.recentCardText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
