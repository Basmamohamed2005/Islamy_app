import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Ui/tabs/hadeth_tab/hadeth.dart';
import 'package:islamy/Ui/tabs/hadeth_tab/hadeth_card.dart';
import 'package:islamy/Ui/widgets/base_tab_body.dart';
import 'package:islamy/core/styles/app_colores.dart';


class HadethTab extends StatelessWidget {
  const HadethTab ({super.key});

  @override
  Widget build(BuildContext context) {

    return   BaseTabBody(child:Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CarouselSlider(
          items: List.generate(50, (index) => HadethCard( hadeth: Hadeth(  id: index+1),)).toList(),
          options: CarouselOptions(height: double.infinity,
          viewportFraction: 0.7,
          aspectRatio: 2,
            enlargeCenterPage: true,
              enlargeFactor: 0.2


          )),
    ) );
  }
}
