import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/widgets/bg/svg_bg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _disclaimerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (_disclaimerVisible) // Show disclaimer based on visibility
              _buildDisclaimerRow(),
            if (_disclaimerVisible) _buildDivider(),
             _buildPaddingRow(),
            const SizedBox(height: 28),
            SizedBox(
              child: SvgBackgroundContainer(
                width: double.infinity,
                height: 90,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                imagePath: 'assets/img/balance_bg.png',
                child: _buildBalanceInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisclaimerRow() {
    return Row(
      children: [
        Image.asset(
          'assets/img/disclaimer.png',
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            'See a total of all your money in one place. Bring all of your accounts into one view.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ImageWithNoTextButton(
          imagePath: 'assets/icons/fi_x.svg',
          imageSize: 20,
          onPressed: () {
            setState(() {
              _disclaimerVisible = false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const SizedBox(
      height: 32,
      child: Divider(
        thickness: 1,
        color: AppColors.primaryDividerGray,
      ),
    );
  }

  Widget _buildPaddingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            elevation: 3,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(45, 21, 95, 0.23),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add_account.svg',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 8),
                      const Text('Add account/card')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceInfo() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "TOTAL BALANCE",
            style: TextStyle(
              color: AppColors.primaryGrayColor6,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "₦0.00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

