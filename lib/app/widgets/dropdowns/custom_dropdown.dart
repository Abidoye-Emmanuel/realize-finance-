import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String label;
  final List<DropdownMenuItem<T>> items;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final String? errorText;
  final String? hint;

  const CustomDropdown({super.key, 
    required this.label,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.hint,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late FocusNode _focusNode;
  Color? iconColor;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    iconColor =
        _focusNode.hasFocus ? AppColors.primaryPurpleColor1 : Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label.isNotEmpty
            ? Text(
                widget.label,
                style: const TextStyle(
                     fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrayColor4,
                    fontSize: 12),
              )
            : Container(),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<T>(
          items: widget.items,
          focusNode: _focusNode,
          value: widget.initialValue,
          onChanged: widget.onChanged,
          hint: const Text(
            'Select',
            style: TextStyle(fontSize: 14, color: AppColors.primaryPlaceholderGray, fontWeight: FontWeight.w400),
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: AppColors.primaryBorderGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: AppColors.primaryPurpleColor1),
            ),
            errorText: widget.errorText,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color:
                AppColors.primaryPurpleColor1, // Use the dynamic color here
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
