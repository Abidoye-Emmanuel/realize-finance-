import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class CustomInput extends StatefulWidget {
  final String? initialValue;
  final String label;
  final String? placeholder;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool isTextArea; // New parameter to determine text area or field
  final TextEditingController? controller;
  final bool isPhoneNumber; // New parameter to handle phone numbers
  final bool withCountryCode; // New parameter to include country code

  const CustomInput({super.key, 
    this.initialValue,
    this.controller,
    required this.label,
    this.placeholder,
    this.onChanged,
    this.isPassword = false,
    this.isTextArea = false, // Default to single-line input
    this.errorText,
    this.isPhoneNumber = false, // Default to regular text input
    this.withCountryCode = false, // Default to no country code
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  bool _isHidden = true;
  Color? iconColor;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
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
            ? Text(widget.label,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrayColor4,
                    fontSize: 12))
            : Container(),
        const SizedBox(height: 8.0),
        if (widget.isPhoneNumber)
          IntlPhoneField(
            initialValue: widget.initialValue.toString() ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: AppColors.primaryBorderGray),
              ),
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
              hintText: widget.placeholder,
              hintStyle: const TextStyle(color: AppColors.primaryPlaceholderGray, fontSize: 14, fontWeight: FontWeight.w400),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    )
                  : null,
              errorText: widget.errorText,
            ),
            initialCountryCode:
                widget.initialValue != null && widget.initialValue!.isEmpty
                    ? 'US'
                    : '',
            onChanged: (phone) {
              widget.onChanged?.call(phone.completeNumber);
            },
          )
       
        else
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            obscureText: widget.isPassword && _isHidden,
            cursorColor: AppColors.primaryPurpleColor1,
            maxLines: widget.isTextArea ? 5 : 1, // or null
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: AppColors.primaryBorderGray),
              ),
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
              hintText: widget.placeholder,
              hintStyle: const TextStyle(color: AppColors.primaryPlaceholderGray, fontSize: 14),
             suffixIcon: widget.isPassword
    ? IconButton(
        onPressed: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
        icon: _isHidden
            ? SvgPicture.asset(
                'assets/icons/show.svg', 
              )
            : SvgPicture.asset(
                'assets/icons/hide.svg', 
              ),
      )
    : null,

              errorText: widget.errorText,
            ),
            onChanged: widget.onChanged,
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
