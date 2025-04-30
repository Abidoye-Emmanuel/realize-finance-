import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/forms/pin_input_form.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

class SignInWithPin extends StatefulWidget {
  const SignInWithPin({super.key});

  @override
  createState() => _SignInWithPinState();
}

class _SignInWithPinState extends State<SignInWithPin>
    with SingleTickerProviderStateMixin {
  final TextEditingController _pinController = TextEditingController();

  void _handleFormSubmit() {
    // Handle form submission logic here
    // For example, you could check the pin or send it to a server
    print("Pin Submitted: ${_pinController.text}");
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent the scaffold from resizing
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(
                text: ''), // You can set the text for the back button here.
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                SpanTextSmall(
                  text: "Kindly enter your 4-digit PIN",
                  color: AppColors.primaryGrayColor3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 64),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              PinInputForm(
                pinController: _pinController,
                onFormSubmit: _handleFormSubmit,
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TransparentTextButton(
                    text: "Logout",
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      // Handle PIN sign-in navigation or logic here
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
