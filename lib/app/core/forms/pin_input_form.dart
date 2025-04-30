import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class PinInputForm extends StatelessWidget {
  final TextEditingController pinController;
  final Function onFormSubmit;

  const PinInputForm({
    Key? key,
    required this.pinController,
    required this.onFormSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryDividerGray),
            borderRadius: BorderRadius.circular(10),
          ),
          child: PinCodeFields(
            length: 4,
            fieldBorderStyle: FieldBorderStyle.bottom,
            responsive: false,
            fieldHeight: 56.0,
            fieldWidth: 56.0,
            borderWidth: 3,
            activeBorderColor: AppColors.primaryPurpleColor1,
            activeBackgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(0), // Keep the fields square
            keyboardType: TextInputType.number,
            autoHideKeyboard: true,
            obscureText: true, //To hide the input for security purposes
            fieldBackgroundColor: Colors.white,
            borderColor: AppColors.primaryBorderGray,
            textStyle: const TextStyle(
              fontSize: 20,
              color: AppColors.primaryBlackColor,
            ),
            onComplete: (String output) {
              // Actions to perform when all the fields have been filled
              onFormSubmit();
            },
          ),
        ),
      ),
    );
  }
}

