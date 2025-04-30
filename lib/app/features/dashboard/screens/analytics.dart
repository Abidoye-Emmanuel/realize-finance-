import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/savings/get_started.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/analytics_disclaimer.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/svg_background_with_text.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AnalyticsDisclaimer(),
            const SizedBox(
              height: 16,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                SvgBackgroundContainerWithText(
                  imagePath: 'assets/bg/savings_bg.svg',
                  text: 'Savings',
                  itemImagePath: 'assets/img/saving.png',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetStartedWithSavings()));
                  },
                ),
                SvgBackgroundContainerWithText(
                  imagePath: 'assets/bg/investment_bg.svg',
                  text: 'Investments',
                  itemImagePath: 'assets/img/investment.png',
                  onPress: () {},
                ),
                SvgBackgroundContainerWithText(
                  imagePath: 'assets/bg/income_bg.svg',
                  text: 'Income',
                  itemImagePath: 'assets/img/income.png',
                  onPress: () {},
                ),
                SvgBackgroundContainerWithText(
                  imagePath: 'assets/bg/gifting_bg.svg',
                  text: 'Gifting',
                  itemImagePath: 'assets/img/gifting.png',
                  onPress: () {},
                ),
                SvgBackgroundContainerWithText(
                  imagePath: 'assets/bg/expenses_bg.svg',
                  text: 'Expenses',
                  itemImagePath: 'assets/img/expenses.png',
                  onPress: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
