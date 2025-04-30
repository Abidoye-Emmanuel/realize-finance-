import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/cancel_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';

class ConfirmPhoneModal extends StatelessWidget {
  final Function onConfirm;
  final String confirmationText;
  final String phoneNumber;
  final bool? isLoading;

  final String title;
  final String callToActionText;

  const ConfirmPhoneModal(
      {super.key, required this.onConfirm,
      this.confirmationText = "You provided your phone number as:  ",
      required this.phoneNumber,
      this.callToActionText = 'Yes',
      this.title = 'Confirm your phone number',
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      content: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlackColor)),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 70% of screen width
                  child: Text(confirmationText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTabGray,
                      )),
                ),
              ),
               const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 70% of screen width
                  child: Text(phoneNumber,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlackColor,
                      )),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                thickness: 1,
                color: AppColors.primaryDividerGray,
              ),
              const SizedBox(height: 8),
              if (isLoading == true)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryPurpleColor1,
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CancelButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the modal
                      },
                      text: 'No',
                      height: 0,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 10),
                    PurpleGradientButton(
                        text: callToActionText,
                        height: 0,
                        fontSize: 12,
                        onPressed: () async {
                          await onConfirm(); // Execute the delete function
                        })
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
