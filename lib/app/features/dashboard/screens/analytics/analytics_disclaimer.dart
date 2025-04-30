import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_outline_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class AnalyticsDisclaimer extends StatefulWidget {
  const AnalyticsDisclaimer({Key? key}) : super(key: key);

  @override
  _AnalyticsDisclaimerState createState() => _AnalyticsDisclaimerState();
}

class _AnalyticsDisclaimerState extends State<AnalyticsDisclaimer> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryPurpleColorLight3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Use Analytics to improve your financials ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      ImageWithNoTextButton(
                          imageSize: 20,
                          imagePath: 'assets/icons/cancel.svg',
                          onPressed: () {
                            setState(() {
                              _isVisible = false;
                            });
                          })
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Get started with all our financial services',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PurpleOutlineButton(
                        onPressed: () {},
                        fontSize: 12,
                        color: AppColors.primaryPurpleColor2,
                        fontWeight: FontWeight.w500,
                        text: 'Learn More',
                      ),
                      Image.asset(
                        'assets/img/learn_analytics.png',
                        width: 47,
                        height: 57,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : const SizedBox(); // Hide widget when _isVisible is false
  }
}
