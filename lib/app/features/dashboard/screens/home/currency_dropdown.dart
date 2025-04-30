import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class CurrencyDropdown extends StatelessWidget {
  final String currencyCode;
  final List<Map<String, String>> currencies;
  final ValueChanged<String?> onChanged;

  const CurrencyDropdown({
    Key? key,
    required this.currencyCode,
    required this.currencies,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.primaryPurpleColorLight4,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.primaryPurpleColorLight3,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currencyCode,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.primaryGrayColor2),
          dropdownColor: Colors.white,
          onChanged: onChanged,
          items: currencies.map<DropdownMenuItem<String>>(
            (Map<String, String> currency) {
              return DropdownMenuItem<String>(
                value: currency['code'],
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      currency['flag']!,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      currency['code']!,
                      style: const TextStyle(color: AppColors.primaryGrayColor2),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
