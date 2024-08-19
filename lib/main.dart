import 'package:flutter/material.dart';
import 'package:furniture/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        },
    );
  }
}
