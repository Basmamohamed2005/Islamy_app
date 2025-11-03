import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/home/home_screen.dart';
import 'package:islamy/Ui/Screens/splash/splash_screen.dart';
import 'package:islamy/Ui/Screens/sura_details/sura_details.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/onbording/onbording_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('onboarding_seen') ?? false;
  runApp(MyApp(seenOnboarding:seenOnboarding ,));
  Sura.generateSurasList();
}
class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key ,required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {SplashScreen.routeName:(context)=>SplashScreen(),
      HomeScreen.routeName:(context)=>HomeScreen(),
        OnbordingPageView.routeName:(context)=>OnbordingPageView(),
        SuraDetails.routeName:(context){
         var sura=ModalRoute.of(context)?.settings?.arguments as Sura;
        return SuraDetails(sura: sura,);
        }

      },
      initialRoute:  seenOnboarding
          ? SplashScreen.routeName
          : OnbordingPageView.routeName,
    );
  }
}
