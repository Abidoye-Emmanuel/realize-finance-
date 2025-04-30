import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:realize_mobile_app/app/features/onboarding/onboarding_screen.dart';
// Import the sign up screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time') ?? true;
// 
    // Using a Future.delayed to simulate some loading time (e.g., for fetching user data or preparing the app)
    Future.delayed(const Duration(seconds: 2), () {
      if (firstTime) {
        prefs.setBool('first_time', false).then((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()));
        });
      } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()));

        // Assuming SignUpScreen exists and is the next screen for returning users
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/icons/splash.svg', fit: BoxFit.cover),
            SvgPicture.asset('assets/icons/logo.svg'),
          ],
        ),
      ),
    );
  }
}
