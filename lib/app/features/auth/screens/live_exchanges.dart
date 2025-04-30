import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/swap/swap_currency.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signin.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signup.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

class LiveExchange extends StatefulWidget {
  const LiveExchange({super.key});

  @override
  createState() => _LiveExchangeState();
}

class _LiveExchangeState extends State<LiveExchange>
    with SingleTickerProviderStateMixin {
  void _submitForm() {
    // Handle the form submission logic here
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
              text: '',
            ), // You can set the text for the back button here.
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Live exchange rates",
                      style: TextStyle(
                          color: AppColors.primaryBlackColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SpanTextSmall(
                          text: "Don’t have an account?",
                          color: AppColors.primaryGrayColor3,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 5.0),
                        TransparentTextButton(
                          text: "Create one",
                          textAlign: TextAlign.center,
                          fontSize: 14,
                          isUnderline: true,
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const CurrencyConverter(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PurpleGradientButton(
                  text: 'Ok, done',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                TransparentTextButton(
                  text: "Sign in",
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignIn()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
