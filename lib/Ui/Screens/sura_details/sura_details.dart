import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/core/styles/app_colores.dart';
import 'package:islamy/core/styles/text_styles.dart';

class SuraDetails extends StatefulWidget {
  static String routeName ="sura details";
  final Sura sura;


  SuraDetails({required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String? suraContent;

  @override
  Widget build(BuildContext context) {
    if (suraContent==null){
      loadSuraDetails();
    }

    return Scaffold(
      backgroundColor: AppColores.black,
      appBar: AppBar(
        backgroundColor: AppColores.black,
        title: Text(widget.sura.nameEn),centerTitle: true,
        foregroundColor: AppColores.gold,

      ),
      body:suraContent==null? Center(child: CircularProgressIndicator(),):
      Text(suraContent!,style: TextStyles.largeBodyTextStyle(),)
    );
  }
   Future<void> loadSuraDetails()async{
    var sura =await rootBundle.loadString(
        "assets/files/${widget.sura.id}.txt",
    );
    var ayas = sura.split("\n");
    String formatedSura="";
    for(int i=0 ;i<ayas.length;i++){
      formatedSura="$formatedSura[${i+1}]${ayas[i].trim()+"  " }";

    }
    suraContent=formatedSura;
    setState(() {

    });

  }
}
