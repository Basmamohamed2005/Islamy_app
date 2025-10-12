import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/home/home_screen.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';
import 'package:islamy/core/styles/text_styles.dart';
import 'package:islamy/onbording/on_bording.dart';
import 'package:islamy/onbording/pageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingPageView extends StatefulWidget {
  static const  String routeName="On bording page";

  const OnbordingPageView({super.key});

  @override
  State<OnbordingPageView> createState() => _OnbordingPageViewState();
}

class _OnbordingPageViewState extends State<OnbordingPageView> {
  List<OnBording> ImgPathes=[
 OnBording(imgpath: AppImages.frame1, text: "Welcome To Islmi App" ,title: " "),
 OnBording(imgpath: AppImages.frame2, title: "Welcome To Islami",text: "We Are Very Excited To Have You In Our Community"),
 OnBording(imgpath: AppImages.frame3, text: "Read, and your Lord is the Most Generous",title: "Reading the Quran"),
 OnBording(imgpath: AppImages.frame4, text: "Praise the name of your Lord, the Most High",title: "Bearish"),
 OnBording(imgpath: AppImages.frame5, text: "You can listen to the Holy Quran Radio through the application for free and easily",title: "Holy Quran Radio"),
  ];
  int scrollIndex=0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemCount: 5,
      itemBuilder: (context, index) => Pagemodel(Imgpath: ImgPathes[scrollIndex].imgpath,title: ImgPathes[scrollIndex].title,
          text: ImgPathes[scrollIndex].text,child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: (){
                  if (scrollIndex<5 && scrollIndex!=0) {
                    scrollIndex-=1;
                  }
                  setState(() {

                  });
                },
                  child: Text("Back",style: TextStyles.largeBodyTextStyle(),),),
                Row(  mainAxisAlignment: MainAxisAlignment.center,


                  children: List.generate(5, (index)=>
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 8,
                          width: scrollIndex==index?15:8,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              color: scrollIndex==index ?AppColores.gold:AppColores.gray),




                        ),
                      ))

                 ,
                ),
                InkWell(onTap: ()async{
                  if(scrollIndex<4){
                    scrollIndex+=1;
                    setState(() {

                    });
                  }
                  else{
                   if(scrollIndex==4){
                     final prefs = await SharedPreferences.getInstance();
                     await prefs.setBool('onboarding_seen', true);
                     Navigator.pushNamed(context, HomeScreen.routeName);
                   }
                  }
                },
                  child: Text("Next",style: TextStyles.largeBodyTextStyle(),),),
              ],
            ),
          ))

    )
    ;

  }
}
