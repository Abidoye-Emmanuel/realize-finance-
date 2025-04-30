import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/forms/sign_up_form.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signin.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/core/modals/confirm_phone_modal.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/features/auth/screens/confirm_phone.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _submitForm() {
    // Handle the form submission logic here

  }
  

  @override
  Widget build(BuildContext context) {
    // Determine if the keyboard is open

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
            child: BackWithTextHeader(text: ''),
          ),
        ),
      ),
      
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                  16.0, 8.0, 16.0, 80.0), // Adjusted for button
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to Realize",
                    style: TextStyle(
                        color: AppColors.primaryGrayColor2,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SpanTextSmall(
                      text: "Already have an account?",
                      color: AppColors.primaryGrayColor3,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 5.0),
                    TransparentTextButton(
                        text: "Sign in",
                        textAlign: TextAlign.center,
                        fontSize: 14,
                        isUnderline: true,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignIn()),
                          );
                        }),
                  ]),
                  const SizedBox(height: 32),
                  SignupForm(onFormSubmit: _submitForm),
                ],
              ),
            ),
          ),
          // Conditionally render the button based on keyboard state
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
              child: PurpleGradientButton(
                text: 'Create my account',
                onPressed: () {
                 showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmPhoneModal(
                    phoneNumber: "+234 7031123456",
                    onConfirm: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ConfirmPhone()),
                          );
                    },
                  );
                },
              );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
