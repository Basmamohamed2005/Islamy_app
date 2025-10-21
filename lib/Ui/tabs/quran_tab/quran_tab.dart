import 'package:flutter/material.dart';
import 'package:islamy/Ui/Screens/sura_details/sura_details.dart';
import 'package:islamy/Ui/models/sura.dart';
import 'package:islamy/Ui/tabs/quran_tab/mosr_recent_card.dart';
import 'package:islamy/Ui/tabs/quran_tab/sura_card.dart';
import 'package:islamy/Ui/widgets/base_tab_body.dart';
import 'package:islamy/assets/app_images.dart';
import 'package:islamy/core/styles/app_colores.dart';
import 'package:islamy/core/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});
 static String routeName="";

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
   List<Sura>fulllist=[];
    List<Sura>searchList=[];
    List<Sura>mostRecent=[];

  void initState(){
    super.initState();
    Sura.generateSurasList();
    for(var sura in Sura.suras){
      fulllist.add(sura);
    } for(var sura in Sura.suras){
      searchList.add(sura);

    }
    readMostRecentSura();


  }
  @override
  Widget build(BuildContext context) {
    return BaseTabBody(child:
    Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(onChanged: (value){
            searchInList(value);

          },
            decoration: InputDecoration(hintText: "Sura Name",
              hintStyle: TextStyles.largeBodyTextStyle(textColor: Colors.white),
              filled:true,fillColor: AppColores.black.withAlpha(90),
              prefixIcon: ImageIcon(AssetImage(AppImages.quran,),color: AppColores.gold,),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColores.gold
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: AppColores.gold
                  )
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: AppColores.gold
                  )
              ),

            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(padding: EdgeInsets.symmetric(horizontal: 21),
            alignment: Alignment.topLeft,
            child: Text("Most Recent",style: TextStyles.largeBodyTextStyle(
                textColor: Colors.white),),
          ),
        ),


        SizedBox(height: 150,child: ListView.separated(separatorBuilder: (_,_)=>SizedBox(width: 16,),
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemBuilder:(_, index) =>MosrRecentCard(sura:mostRecent[index] , onSuraClick: onsuraclick),
          itemCount: mostRecent.length,
        ),),
    Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(padding: EdgeInsets.symmetric(horizontal: 21),
    alignment: Alignment.topLeft,
    child: Text("Suras List",style: TextStyles.largeBodyTextStyle(
    textColor: Colors.white),),
    ),

    ),



        Expanded(
          child: SizedBox(height: 130,
            child: ListView.separated(
                itemBuilder:(context, index) => SuraCard(sura:searchList[index],onSuraClick:onsuraclick
                  ,number: (index+1).toString(),),

                separatorBuilder:(_, _) => Divider(indent: 40,
                  endIndent: 40,color: Colors.white,thickness: 3,) ,
                itemCount:searchList.length),
          ),
        )
      ],
    ));



  }

  void searchInList(String value) {
    var resultSearch=fulllist.where((element)=>element.nameEn.toLowerCase().contains(value.toLowerCase())).toList();
    if(resultSearch.isEmpty){
      resultSearch=fulllist.where((element)=>element.nameAr.contains(value)).toList();
    }
      searchList=resultSearch;
      setState(() {

    });
  }

  Future <void> onsuraclick(Sura sura)async {
    Navigator.pushNamed(context, SuraDetails.routeName,arguments: sura);

    SharedPreferences preferences= await SharedPreferences.getInstance();
    List<String>SurasIds=preferences.getStringList("Most Recent")??[];
    if(SurasIds.contains(sura.id.toString())){
      SurasIds.removeWhere(( id)=>id==sura.id.toString());
    }
    SurasIds=[sura.id.toString(),...SurasIds];
    await preferences.setStringList("Most Recent", SurasIds);
    setState(() {

    });
  }

  Future <void>  readMostRecentSura() async {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    List<String>SurasIds=preferences.getStringList("Most Recent")??[];
    for (var value in SurasIds){
      mostRecent.add(fulllist.where((element)=>element.id.toString()==value).first);
      setState(() {

      });

    }


  }
}


