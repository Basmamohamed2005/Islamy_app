import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/home/home_screen.dart';
import 'package:islamy/Ui/Screens/splash/splash_screen.dart';
import 'package:islamy/Ui/Screens/sura_details/sura_details.dart';
import 'package:islamy/Ui/models/sura.dart';

void main(){
  runApp(MyApp());
  Sura.generateSurasList();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {SplashScreen.routeName:(context)=>SplashScreen(),
      HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetails.routeName:(context){
         var sura=ModalRoute.of(context)?.settings?.arguments as Sura;
        return SuraDetails(sura: sura,);
        }

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
