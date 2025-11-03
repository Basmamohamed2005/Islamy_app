import 'package:flutter/material.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/text_styles.dart';

class SuraCard extends StatelessWidget {
  final Sura sura;
  final String number;
  final Function(Sura) onSuraClick;



  const SuraCard({required this.sura,required this.number, required this.onSuraClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){
      onSuraClick(sura);
    },
      child: Row(
        children: [
          Stack(alignment: Alignment.center,
        children: [
          Image.asset(AppImages.suraNumberDecoration),
        Text(number,style: TextStyle(color: Colors.white),)],),
        SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(sura.nameEn,style: TextStyles.mediumLabelTextStyle(
              textColor: Colors.white)),Text(" ${sura.ayaNumbers.toString()} Verses",
                style: TextStyles.largeBodyTextStyle(textColor: Colors.white))
          ],
          ),
        ),
      
        Text(sura.nameAr,style: TextStyles.mediumLabelTextStyle(textColor: Colors.white),)
      ],
      
      
      ),
    ) ;
  }
}
