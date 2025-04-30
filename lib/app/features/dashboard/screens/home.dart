import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/modals/custom_show_modal.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/home/kyc_section.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/home/balance_card.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/home/realize_account_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> currencies = [
    {
      'code': 'USD',
      'flag': 'assets/flags/usd.png',
    },
    {
      'code': 'NGN',
      'flag': 'assets/flags/ngn.png',
    },
    {
      'code': 'EURO',
      'flag': 'assets/flags/euro.png',
    },
    {
      'code': 'CAD',
      'flag': 'assets/flags/cad.png',
    },
    {
      'code': 'GBP',
      'flag': 'assets/flags/gbp.png',
    },
  ];

  bool isKYCVerified = false;
  String currencyCode = 'NGN'; // Initial currency code

  void updateCurrency(String? newValue) {
    if (newValue != null && newValue != currencyCode) {
      setState(() {
        currencyCode = newValue;
      });
    } else {
      // Handle the case when the user tries to set the same currency
      // For example, show a Toast message or ignore the change
    }
  }

  void verifyKYC() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomShowModal(
          confirmationText:
              'To gain access to your Realize accounts, kindly complete your KYC verification',
          title: 'Complete your KYC',
          callToActionText: 'Verify now',
          onConfirm: () async {
            setState(() {
              isKYCVerified = true;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          KYCSection(
            isKYCVerified: isKYCVerified,
            verifyKYC: verifyKYC,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'My accounts',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryGrayColor3),
              ),
              const SizedBox(
                width: 8,
              ),
              ImageWithNoTextButton(
                  imagePath: 'assets/icons/info_2.svg',
                  imageSize: 20,
                  onPressed: () {})
            ],
          ),
          const BalanceCard(),
          const SizedBox(height: 16),
          RealizeAccountsSection(
            currencies: currencies,
            currencyCode: currencyCode,
            onChanged: updateCurrency,
          ),
        ],
      ),
    );
  }
}
