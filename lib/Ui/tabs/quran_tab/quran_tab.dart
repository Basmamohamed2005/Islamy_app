import 'package:flutter/material.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/Ui/tabs/quran_tab/sura_card.dart';
import 'package:islamy/Ui/widgets/base_tab_body.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/text_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});
 static String routeName="";

  @override
  Widget build(BuildContext context) {
    return BaseTabBody(child: Column(
      children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 21),
          alignment: Alignment.topLeft,
          child: Text("Suras List",style: TextStyles.largeBodyTextStyle(
              textColor: Colors.white),),
        )
        ,Expanded(
          child: ListView.separated(
              itemBuilder:(context, index) => SuraCard(sura: Sura.suras[index],number: (index+1).toString(),),

              separatorBuilder:(_, _) => Divider(indent: 40,
                endIndent: 40,color: Colors.white,thickness: 3,) ,
              itemCount:Sura.suras.length),
        )
      ],
    ));



  }
}
