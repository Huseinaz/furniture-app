import 'package:flutter/material.dart';
import 'package:furniture/components/my_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment:
                        Alignment.centerLeft,
                    child: Text(
                      'Enjoy Your Online\nShopping.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 75, 75, 75)
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Browse through all categories and shop the best furniture for your dream house.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 161, 161, 161)
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            buttonText: 'Get Started',
          ),
        ],
      ),
    );
  }
}
