import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../nav_bar/nav_bar.dart';
import '../onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  final String? token;

  const SplashView({super.key, this.token});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('onboarding_seen') ?? false;

    Widget nextScreen;

    if (widget.token != null) {
      // 🔥 logged in already → روح على ال Home
      nextScreen = NavBarLayout();
    } else {
      // 🔥 مستخدم جديد
      nextScreen = seenOnboarding ? NavBarLayout() : OnboardingScreen();
    }

    Navigator.pushReplacement(
      context,
      PageTransition(type: PageTransitionType.fade, child: nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash.png', fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/HELLO.png', height: 30),
                const SizedBox(height: 20),
                const Text(
                  'Easy medical solutions',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF004E7F),
                    fontWeight: FontWeight.bold,
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
