import 'package:flutter/material.dart';
import 'package:islamy/Ui/tabs/hadeth_tab.dart';
import 'package:islamy/Ui/tabs/quran_tab/quran_tab.dart';
import 'package:islamy/Ui/tabs/radio_tab.dart';
import 'package:islamy/Ui/tabs/sebha_tab.dart';
import 'package:islamy/Ui/tabs/time_tab.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';

class HomeScreen extends StatefulWidget {
  static String routeName="Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>tabs=[QuranTab(),
    HadethTab(),
    sebhaTab(),
    RadioTab()  ,
    TimeTab(),
  ];
List<String>backgrounImages=[AppImages.quranbc,
  AppImages.hadethbg,
  AppImages.sebhabg,
  AppImages.radiobg,
  AppImages.morebg,
];


  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
        child: Scaffold(body: tabs[selectedIndex],
          backgroundColor: Colors.transparent,

          bottomNavigationBar: SizedBox(height: 120,
            child: BottomNavigationBar(
                currentIndex:selectedIndex ,
                onTap: (newIndex){
                  selectedIndex=newIndex;

                  setState(() {

                  });
                },
                unselectedItemColor: AppColores.black,
                selectedItemColor: AppColores.white,
                type:BottomNavigationBarType.fixed ,
                backgroundColor: AppColores.gold,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(icon:
                  customBottomNavigationBarIcon(imagePath: AppImages.quran, isSelected: selectedIndex==0),
                      label:  "Quran"),
                  BottomNavigationBarItem(icon:
                  customBottomNavigationBarIcon(imagePath: AppImages.hadeth, isSelected: selectedIndex==1),
                      label: "hadeth"),
                  BottomNavigationBarItem(icon:
                  customBottomNavigationBarIcon(imagePath: AppImages.sebha, isSelected: selectedIndex==2),
                      label: "sebha"),
                  BottomNavigationBarItem(icon:
                  customBottomNavigationBarIcon(imagePath: AppImages.radio, isSelected: selectedIndex==3),
                      label: "radio"),
                  BottomNavigationBarItem(icon:
                  customBottomNavigationBarIcon(imagePath: AppImages.hadeth, isSelected: selectedIndex==1),
                      label: "time"),
                ]),
          ),

        )

        ,decoration: BoxDecoration( gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,
          colors:[ AppColores.black,

            AppColores.black.withAlpha(180)]),),),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backgrounImages[selectedIndex]),
              fit:BoxFit.cover )),
    );
  }
}

 class customBottomNavigationBarIcon extends StatelessWidget {
   String imagePath;
  bool isSelected;


  customBottomNavigationBarIcon({required this.imagePath, required this.isSelected});

  @override
   Widget build(BuildContext context) {
     return  AnimatedSwitcher(
       duration: Duration(milliseconds: 300),
     transitionBuilder: (child,animation)=>ScaleTransition(scale: animation,child: child,),
     child: isSelected?Container(child: ImageIcon(AssetImage(imagePath)),
         decoration: BoxDecoration(
             color: AppColores.black.withAlpha(50),borderRadius: BorderRadius.circular(100)
         ),
         padding: EdgeInsets.symmetric(
             vertical:8,horizontal:16 )): ImageIcon(AssetImage(imagePath)),
     );
   }
 }
