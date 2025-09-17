import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/home/home_screen.dart';
import 'package:islamy/assets/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const  String routeName="splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [Image.asset(AppImages.splashBackground,fit: BoxFit.cover,width: double.infinity,).zoomIn()
        ,Positioned(
            right: 0,
              left: 0,
              top: mediaQuery.height*0.06,

              child: ZoomIn(child: Image.asset(AppImages.mosque).zoomIn())),


               Positioned(
               right: mediaQuery.width*0.03,
               top:0,

              child: Image.asset(AppImages.glow).zoomIn()),
          Positioned(
              top:mediaQuery.height*0.25,

              child: ZoomIn(child: Image.asset(AppImages.shape07).zoomIn())),
          Positioned(
               bottom: mediaQuery.height*0.12,
                right: 0,

              child: ZoomIn(child: Image.asset(AppImages.shape04).zoomIn())),
          Positioned(
               bottom: mediaQuery.height*0.01,
                right: 0,
              left: 0,

              child: ZoomIn(child: Image.asset(AppImages.routeLogo))),
          Center(


              child: ZoomIn(child: Image.asset(AppImages.group36).zoomIn())),


        ],
      ),

    );
  }
}
