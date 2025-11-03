import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/Ui/tabs/hadeth_tab/hadeth.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';

class HadethCard extends StatefulWidget {
  Hadeth hadeth ;


  HadethCard({ required this.hadeth});

  @override
  State<HadethCard> createState() => _HadethCardState();
}

class _HadethCardState extends State<HadethCard> {
  String? hadethTitle;
  String ? hadeetContent;
  @override
  void initState() {
    super.initState();
    loadHadethContent();
  }

  @override
  Widget build(BuildContext context) {


    return  Container(alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: AppColores.gold, image: DecorationImage(
            image: AssetImage(AppImages.HadithCardBackGround))),



            child:Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.hadethleftcorner),
                    hadeetContent==null?CircularProgressIndicator():Expanded(child: hadethTitle==null? Text("dont"):Text(hadethTitle!)),
                    Image.asset(AppImages.hadethrightcorner),
                  ],),),

              Expanded(child: hadeetContent==null? CircularProgressIndicator():Center(child: Text(hadeetContent!))),
              Image.asset(AppImages.imgbottomdecoration,color: AppColores.black,)
            ],) ,
      );
  }

  void loadHadethContent() async{
    var hadeeth;
      hadeeth=await rootBundle.loadString("assets/Hadeeth/h${widget.hadeth.id}.txt");
      List<String >lines=hadeeth.toString().trim().split('\n');
      hadethTitle=lines[0];


    hadeetContent=hadeetContent=lines.length > 1 ? lines.sublist(1).join('\n') : "";;
    ;
    setState(() {

    });

  }
}
