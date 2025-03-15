import 'package:flutter/material.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/features/Home/presentation/view/widgets/common_button.dart';
import 'package:tkc/features/Home/presentation/view/widgets/recent_transaction_card.dart';
import 'package:tkc/features/Home/presentation/view/widgets/revenu_card.dart';
import 'package:tkc/theme/app_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  RevenuCard(
                      cardColor: AppColors.revenuContainer,
                      revenu: '2,980',
                      revenuType: 'Today Revenue'),
                  SizedBox(
                    width: 8,
                  ),
                  RevenuCard(
                      cardColor: AppColors.revenuContainer2,
                      revenu: '41.253',
                      revenuType: 'Weekly Revenue'),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CommonButton(text: 'View Total Sales', onTap: () {}),
              // SizedBox(
              //   height: 16,
              // ),
              // CommonButton(text: 'Add Purchased Item', onTap: () {}),
              SizedBox(
                height: 32,
              ),
              AppText(
                  text: 'Recent',
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: 16,
              ),

              ///recent transaction list
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (ctx, i) => RecentTransactionCard()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
