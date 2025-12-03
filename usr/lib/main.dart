import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/auth/age_verification_screen.dart';
import 'package:couldai_user_app/screens/auth/phone_login_screen.dart';
import 'package:couldai_user_app/screens/auth/username_screen.dart';
import 'package:couldai_user_app/screens/main_layout.dart';

void main() {
  runApp(const LinelinkApp());
}

class LinelinkApp extends StatelessWidget {
  const LinelinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linelink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C300), // Line-like green
          primary: const Color(0xFF00C300),
          secondary: Colors.black,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AgeVerificationScreen(),
        '/login': (context) => const PhoneLoginScreen(),
        '/username': (context) => const UsernameScreen(),
        '/home': (context) => const MainLayout(),
      },
    );
  }
}
