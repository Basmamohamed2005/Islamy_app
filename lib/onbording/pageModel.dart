import 'package:flutter/material.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';
import 'package:islamy/core/styles/text_styles.dart';

class Pagemodel extends StatelessWidget {
  String Imgpath;
  String title;
  String text;
  Widget child;


  Pagemodel({
    required this.Imgpath,
    required this.title,
    required this.text,
    required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.black,
      body:
      SafeArea(
        child: Column(
          children: [
            Center(child: Image.asset(AppImages.imgheader)
          ),
            SizedBox(height: 20,),
            Image.asset(Imgpath,width: 280,height: 280,),
               SizedBox(height: 20,),

               Expanded(
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Center(child: Text(title,style: TextStyles.largeLabelTextStyle(),))),
                  ],
                               ),
               ),

             Expanded(flex: 2,
               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(child: Text(text,textAlign: TextAlign.center,
                        style: TextStyles.largeBodyTextStyle(),)),
                    )),
                  ],
                ),
             ),

            child
          ]
          ,
        ),
      ),
    );
  }
}
