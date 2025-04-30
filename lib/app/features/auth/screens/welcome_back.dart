import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/bg/svg_bg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signin.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signup.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/features/auth/screens/live_exchanges.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack>
    with SingleTickerProviderStateMixin {
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
          title: Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(
              text: '',
              onPressed: () {},
            ), // You can set the text for the back button here.
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Glad to have you back!",
                  style: TextStyle(
                      color: AppColors.primaryBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                      }),
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgBackgroundContainer(
                    width: double.infinity,
                    height: 100,
                    imagePath: 'assets/icons/new_bg.svg',
                    borderRadius: BorderRadius.circular(10),
                    child: Container(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LiveExchange()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgBackgroundContainer(
                      width: double.infinity,
                      height: 80,
                      imagePath: 'assets/icons/live_bg.svg',
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Live exchange rates',
                                  style: TextStyle(
                                      color: AppColors.primaryGrayColor2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              ImageWithNoTextButton(
                                imageSize: 32,
                                imagePath: 'assets/icons/arrow-forward.svg',
                                onPressed: () {
                                  // Your button click logic here
                                  Navigator.pop(context);
                                },
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgBackgroundContainer(
                      width: double.infinity,
                      height: 80,
                      imagePath: 'assets/icons/signin_bg.svg',
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Sign in to your account',
                                  style: TextStyle(
                                      color: AppColors.primaryGrayColor2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              ImageWithNoTextButton(
                                imageSize: 32,
                                imagePath: 'assets/icons/arrow-forward.svg',
                                onPressed: () {
                                  // Your button click logic here
                                  Navigator.pop(context);
                                },
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
