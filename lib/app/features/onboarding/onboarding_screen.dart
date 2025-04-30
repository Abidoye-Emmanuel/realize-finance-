import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signup.dart';
import 'package:realize_mobile_app/app/features/auth/screens/signin.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/transparent_text_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryPurpleColor1
            : AppColors.primaryGrayColor1,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  Widget _buildOnboardingPage(String text, String imagePath) {
    // Get the screen height and calculate spacing dynamically
    double screenHeight = MediaQuery.of(context).size.height;
    double textImageSpacing = screenHeight * 0.02; // 2% of screen height
    double bottomSpacing =
        screenHeight * 0.25; // 25% of screen height for the bottom spacing

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              color: AppColors.primaryBlackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: textImageSpacing),
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          SizedBox(height: bottomSpacing),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurpleColorLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  _buildOnboardingPage(
                    'Manage your finances with realize',
                    'assets/img/onboarding_1.png',
                  ),
                  _buildOnboardingPage(
                    'Effortlessly switch between currencies with realize',
                    'assets/img/onboarding_2.png',
                  ),
                  _buildOnboardingPage(
                    'Make Global payment with realize cards',
                    'assets/img/onboarding_payment.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomSheet(), // Refactored bottom sheet into a method
    );
  }

  Widget _buildBottomSheet() {
    // Use MediaQuery to adjust bottom sheet height dynamically
    double bottomSheetHeight =
        MediaQuery.of(context).size.height * 0.3; // 30% of screen height

    return Container(
      color: Colors.white,
      height: bottomSheetHeight,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          SizedBox(
              height: bottomSheetHeight *
                  0.2), // Dynamic spacing based on bottomSheetHeight
          PurpleGradientButton(
              text: 'Create my account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              }),
          SizedBox(height: bottomSheetHeight * 0.05), // Smaller dynamic spacing
          TransparentTextButton(
              text: 'Sign in',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              }),
        ],
      ),
    );
  }
}
