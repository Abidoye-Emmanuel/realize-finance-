import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
// Safe pots tab component

class SafePotsTab extends StatelessWidget {
  const SafePotsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/no_account.svg',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No account selected',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryPurpleColorLight5,
            ),
          ),
        ],
      ),
    );
  }
}
