import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/forms/sign_in_form.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signup.dart';
import 'package:realize_mobile_app/app/widgets/texts/span_text_small.dart';
import 'package:realize_mobile_app/app/widgets/navigation/navigation_menu.dart';
import 'package:realize_mobile_app/app/features/auth/screens/welcome_back.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signin_with_pin.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  SignInMode _currentMode = SignInMode.phone;

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
          title: Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(
              text: '',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WelcomeBack()));
              },
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
                  "Sign in to your account",
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
                const Divider(
                  thickness: 1,
                  color: AppColors.primaryDividerGray,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(2, (index) => _buildTab(index)),
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                  child:
                      SignInForm(onFormSubmit: _submitForm, mode: _currentMode),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                  child:
                      SignInForm(onFormSubmit: _submitForm, mode: _currentMode),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PurpleGradientButton(
                  text: 'Sign in',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationMenu()));
                  },
                ),
                const SizedBox(height: 16),
                TransparentTextButton(
                    text: "Sign in with your PIN",
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInWithPin()),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index) {
    List<String> tabTitles = ["Phone number", "Email address"];
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        setState(() => index == 0
            ? _currentMode = SignInMode.phone
            : _currentMode = SignInMode.email);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedIndex == index
                  ? AppColors.primaryBlackColor
                  : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          tabTitles[index],
          style: TextStyle(
            color: _selectedIndex == index
                ? AppColors.primaryBlackColor
                : AppColors.primaryTabGray,
            fontWeight:
                _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
