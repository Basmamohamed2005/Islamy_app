import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/home/home_screen.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/onbording/onbording_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('onboarding_seen') ?? false;

    if (seenOnboarding) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, OnbordingPageView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashBackground,
            fit: BoxFit.cover,
            width: double.infinity,
          ).zoomIn(),

          Positioned(
            right: 0,
            left: 0,
            top: mediaQuery.height * 0.06,
            child: ZoomIn(child: Image.asset(AppImages.mosque)),
          ),

          Positioned(
            right: mediaQuery.width * 0.03,
            top: 0,
            child: ZoomIn(child: Image.asset(AppImages.glow)),
          ),

          Positioned(
            top: mediaQuery.height * 0.25,
            child: ZoomIn(child: Image.asset(AppImages.shape07)),
          ),

          Positioned(
            bottom: mediaQuery.height * 0.12,
            right: 0,
            child: ZoomIn(child: Image.asset(AppImages.shape04)),
          ),

          Positioned(
            bottom: mediaQuery.height * 0.01,
            right: 0,
            left: 0,
            child: ZoomIn(child: Image.asset(AppImages.routeLogo)),
          ),

          Center(
            child: ZoomIn(child: Image.asset(AppImages.group36)),
          ),
        ],
      ),
    );
  }
}
