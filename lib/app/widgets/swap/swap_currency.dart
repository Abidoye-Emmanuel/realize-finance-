import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String fromCurrency = 'USD';
  String toCurrency = 'NGN';
  double rate = 1212; // Example rate, you should fetch this from an API
  late double inputAmount;
  late double outputAmount;

  void _updateFromCurrency(String? newValue) {
    if (newValue != null && newValue != toCurrency) {
      setState(() {
        fromCurrency = newValue;
        // You might want to recalculate the conversion here if needed
      });
    } else {
      // Handle the case when the user tries to set the same currency (optional)
      // For example, show a Toast message or ignore the change
    }
  }

  void _updateToCurrency(String? newValue) {
    if (newValue != null && newValue != fromCurrency) {
      setState(() {
        toCurrency = newValue;
        // Recalculate conversion if necessary
      });
    } else {
      // Handle the case when the user tries to set the same currency (optional)
    }
  }

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

  @override
  void initState() {
    super.initState();
    inputAmount = 0.0; // Or any other initial value you prefer
    outputAmount = inputAmount * rate;
  }

  void _switchCurrencies() {
    setState(() {
      String tempCurrency = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = tempCurrency;

      double tempAmount = inputAmount;
      inputAmount = outputAmount / rate;
      outputAmount = tempAmount;
    });
  }

  Widget _buildCurrencyInput({
    required String label,
    required String value,
    required Function(String) onFieldSubmitted,
    required String currencyCode,
    required List<Map<String, String>> currencies,
    required Function(String?) onCurrencyChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primaryGrayColor1,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGrayColor2,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '0.0',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryGrayColor2,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: onFieldSubmitted,
                    initialValue: value,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryBlackColor,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurpleColor1,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: currencyCode,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),
                      dropdownColor: AppColors.primaryPurpleColor1,
                      onChanged: onCurrencyChanged,
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
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String currencyCode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: currencyCode,
          icon: const Icon(Icons.arrow_drop_down,
              color: AppColors.primaryPurpleColor1),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          isExpanded: true,
          items: currencies
              .map<DropdownMenuItem<String>>((Map<String, dynamic> currency) {
            return DropdownMenuItem<String>(
              value: currency['code'],
              child: Row(
                children: <Widget>[
                  Image.asset(currency['flag'],
                      width: 24, height: 24), // Use the flag image from assets
                  const SizedBox(width: 10),
                  Text(currency['code']),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              // Assuming fromCurrency is what you want to change
              fromCurrency = newValue!;
              // Recalculate conversion if necessary
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryPurpleColorLight2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                ImageWithNoTextButton(
                  imageSize: 32,
                  imagePath: 'assets/icons/info.svg',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCurrencyInput(
              label: 'You send:',
              value: inputAmount.toString(),
              onFieldSubmitted: (value) {
                setState(() {
                  inputAmount = double.tryParse(value) ?? 0.0;
                  outputAmount = inputAmount * rate;
                });
              },
              currencyCode: fromCurrency,
              currencies: currencies,
              onCurrencyChanged: _updateFromCurrency,
            ),
            Row(
              children: <Widget>[
                ImageWithNoTextButton(
                  imageSize: 90,
                  imagePath: 'assets/icons/swap.svg',
                  onPressed: _switchCurrencies,
                ),
                const SizedBox(width: 10),
                Row(
                  children: <Widget>[
                    Text(
                      'Rate: 1 $fromCurrency = $rate $toCurrency',
                      style: const TextStyle(
                          color: AppColors.primaryGrayColor2, fontSize: 14),
                    ),
                    const SizedBox(width: 6),
                    ImageWithNoTextButton(
                      imageSize: 20,
                      imagePath: 'assets/icons/shock.svg',
                      onPressed: _switchCurrencies,
                    ),
                  ],
                ),
              ],
            ),
            _buildCurrencyInput(
              label: 'Receiver gets:',
              value: outputAmount.toStringAsFixed(2),
              onFieldSubmitted: (value) {
                setState(() {
                  outputAmount = double.tryParse(value) ?? 0.0;
                  inputAmount = outputAmount / rate;
                });
              },
              currencyCode: toCurrency,
              currencies: currencies,
              onCurrencyChanged: _updateToCurrency,
            ),
          ],
        ),
      ),
    );
  }
}
