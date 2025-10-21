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
    'سبحان الله وبحمده عدد خلقه ورضا نفسه وزنة عرشه ومداد كلماته',
  ];
  @override
  Widget build(BuildContext context) {
    return BaseTabBody(child: InkWell(splashColor: Colors.transparent,
      focusColor: Colors.transparent,highlightColor: Colors.transparent ,hoverColor:  Colors.transparent,
      onTap: (){
      sebhaCounter+=1;
      wordsCounter+=1;
      if ( wordsCounter >10 ){
        wordsCounter=1;
      }

      setState(() {

      });
    },
      child: Column(
      
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " ,style: TextStyles.largeTitleTextStyle(textColor: Colors.white),),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(alignment: Alignment.center,
              children: [
                Image.asset("assets/images/SebhaBody 1 .png"),
                Column(
                  children: [
                    Text(tasbihWords[wordsCounter],style: TextStyles.largeTitleTextStyle(textColor: Colors.white),),
                    Text( sebhaCounter.toString() ,style: TextStyles.largeTitleTextStyle(textColor: Colors.white),),
                  ],
                )
              ],
            ),
          )],
      ),
    ),);
  }
}
