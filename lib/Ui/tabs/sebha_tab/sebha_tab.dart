import 'package:flutter/material.dart';
import 'package:islamy/Ui/widgets/base_tab_body.dart';
import 'package:islamy/core/styles/text_styles.dart';

class sebhaTab extends StatefulWidget {
  const sebhaTab({super.key});

  @override
  State<sebhaTab> createState() => _sebhaTabState();
}

class _sebhaTabState extends State<sebhaTab> {
  int sebhaCounter=0;
  int wordsCounter=0;
  List<String> tasbihWords = [
    "  ",
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'سبحان الله وبحمده',
    'سبحان الله العظيم',
    'أستغفر الله',
    'لا حول ولا قوة إلا بالله',
    'اللهم صلِّ على محمد',

  ];
  double turns = 0.0;
  bool Azkar=false;
  void _changeRotation() {
    setState(() => turns  += 1.0 / 64.0);
  }


  @override
  Widget build(BuildContext context) {
    return BaseTabBody(child: GestureDetector(
      onTap: (){

      sebhaCounter+=1;
      if ( wordsCounter >9 ){
        wordsCounter=1;
      }
      if( sebhaCounter%33==0){
        wordsCounter+=1;
      }
      if (sebhaCounter==1) {
        wordsCounter=1;

      }


      _changeRotation();

      setState(() {

      });
    },
      child: Column(

        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " ,style: TextStyles.largeTitleTextStyle(textColor: Colors.white),),
          SizedBox(height: 40,),
          Expanded(
            child: Stack(alignment: Alignment.center,
              children: [
                Stack(alignment: Alignment.topCenter,
                  children: [
                    Positioned(width: 50,top: 0,
                        child: Image.asset("assets/images/Mask group .png",)),
                    Positioned(top: 50,
                        child:  AnimatedRotation(
                            turns: turns,duration: Duration(milliseconds: 120),
                            child: Image.asset("assets/images/SebhaBody 1 (1).png"))),

                  ],
                ),
                Positioned(bottom: MediaQuery.of(context).size.height*0.339,
                  child: Column(
                    children: [
                      Text(sebhaCounter.toString(),style: TextStyles.mediumLabelTextStyle(),textAlign: TextAlign.center,),
                      Text( tasbihWords[wordsCounter]

                        ,style: TextStyles.mediumLabelTextStyle(),textAlign: TextAlign.center,),
                    ],
                  ),
                )
              ],
            ),
          )

          ],


      ),
    ),);

  }
}
