import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) {},
                children: [
                  // TODO: Add onboarding pages
                  _buildOnboardingPage('Sayfa 1', 'Açıklama 1'),
                  _buildOnboardingPage('Sayfa 2', 'Açıklama 2'),
                  _buildOnboardingPage('Sayfa 3', 'Açıklama 3'),
                ],
              ),
            ),
            // TODO: Add page indicator and buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to main screen
                },
                child: const Text('Başla'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(String title, String description) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          Text(description),
        ],
      ),
    );
  }
}
