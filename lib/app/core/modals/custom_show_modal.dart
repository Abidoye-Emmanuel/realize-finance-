import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class CustomShowModal extends StatelessWidget {
  final Function onConfirm;
  final String confirmationText;
  final bool? isLoading;

  final String title;
  final String callToActionText;

  const CustomShowModal(
      {super.key,
      required this.onConfirm,
      this.confirmationText = "",
      this.callToActionText = '',
      this.title = '',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ImageWithNoTextButton(
                      imagePath: 'assets/icons/fi_x.svg',
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.7, // 70% of screen width
                  child: Text(confirmationText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                thickness: 1,
                color: AppColors.primaryDividerGray,
              ),
              const SizedBox(height: 16),
              if (isLoading == true)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors
                        .primaryPurpleColor1, // Use the app's primary color here
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TransparentTextButton(
                        text: callToActionText,
                        fontSize: 14,
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
