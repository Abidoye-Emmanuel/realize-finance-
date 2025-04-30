import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realize',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: const ColorScheme.light(
          primary: Colors.white, // Primary color for the app
          secondary: Colors.white, // Secondary color for the app
          surface: Colors.white, // Background color for Scaffold and Scrollables
          error: Colors.red, // Color to use for input validation errors, etc.
          onPrimary: Colors
              .black, // Typically contrast color for text/icon on top of primary color
          onSecondary: Colors.black, // Similarly, for secondary
          onSurface: Colors.black, // Text/icons color on background color
          onError: Colors.white, // Text/icons color on error color
          brightness: Brightness.light, // Overall theme brightness
        ),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const SplashScreen(),
    );
  }
}
