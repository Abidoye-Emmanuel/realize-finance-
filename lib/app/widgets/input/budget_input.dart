import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class BudgetInput extends StatefulWidget {
  final String? initialValue;
  final String label;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const BudgetInput({super.key, 
    this.initialValue,
    required this.label,
    this.placeholder,
    this.onChanged,
    this.errorText,
  });

  @override
  _BudgetInputState createState() => _BudgetInputState();
}

class _BudgetInputState extends State<BudgetInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  final String defaultCurrency = 'NGN'; // Default currency symbol is NGN

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _focusNode = FocusNode();
  }

  void _formatCurrency(String value) {
    final numericValue = double.tryParse(value.replaceAll(',', '')) ?? 0.0;
    final formattedValue = NumberFormat.currency(
      locale: 'en_US',
      symbol: defaultCurrency,
      decimalDigits: 0, // Set the number of decimal digits
    ).format(numericValue);
    _controller.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryPurpleColor1,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          cursorColor: AppColors.primaryPurpleColor1,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.primaryGrayColor1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.primaryGrayColor1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.primaryPurpleColor1,
              ),
            ),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(
              color: AppColors.primaryGrayColor1,
            ),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(12.0), // Adjust padding as needed
            //   child: Text(
            //     defaultCurrency,
            //     style: const TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            errorText: widget.errorText,
          ),
          onChanged: (value) {
            _formatCurrency(value);
            widget.onChanged?.call(value);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
