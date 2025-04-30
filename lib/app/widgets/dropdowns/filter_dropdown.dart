import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class FilterDropdown extends StatelessWidget {
  final String title;
  final TextEditingController
      controller; // Controller to manage the selected value
  final List<String> options; // List of options for the dropdown
  final String? initialValue; // Initial value for the dropdown

  const FilterDropdown({super.key, 
    required this.title,
    required this.controller,
    required this.options,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryPurpleColor1,
                  fontSize: 14)), // Label
          const SizedBox(height: 8), // Spacing between label and dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            hint: const Text('Select an Option'), // Placeholder
            value: controller.text.isNotEmpty ? controller.text : initialValue,
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle change and update the controller
              controller.text = newValue ?? '';
            },
          ),
        ],
      ),
    );
  }
}
