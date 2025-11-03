import 'package:flutter/material.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/Ui/tabs/quran_tab/sura_card.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';
import 'package:islamy/core/styles/text_styles.dart';

class MosrRecentCard extends StatelessWidget {
  final Sura sura;
  final Function(Sura) onSuraClick;

  MosrRecentCard({required this.sura, required this.onSuraClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      onSuraClick(sura);
    }
      ,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColores.gold,
      borderRadius: BorderRadius.circular(16),
      ),
        child:
        Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn,style: TextStyles.largeLabelTextStyle(textColor:Colors.black ),),
                Text(sura.nameAr,style: TextStyles.largeLabelTextStyle(textColor:Colors.black )),
                Text("${sura.ayaNumbers} Verses",style: TextStyles.largeBodyTextStyle(textColor:Colors.black )),
              ]
              ,
            ),
            Image.asset(AppImages.quranSura)
          ],
        ),),
    );
  }
}
