import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islame_application/hadeth_Model.dart';
import 'package:islame_application/tabs/hadeth_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allahadeth = [];

  @override
  Widget build(BuildContext context) {
    if(allahadeth.isEmpty){loadHadethfile();}
    return Column(
      children: [
        Image.asset(
            "assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png"),
        Divider(
          thickness: 2,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: GoogleFonts.elMessiri(
              fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Divider(
          thickness: 2,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(
                  thickness: 1,
                  endIndent: 35,
                  indent: 35,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethContent.routeName,arguments: allahadeth[index]);
                },
                child: Text(
                  allahadeth[index].title,
                  style: GoogleFonts.quicksand(fontSize: 25),
                  textAlign: TextAlign.center,),
              );
            },
            itemCount: allahadeth.length,
          ),
        ),
      ],
    );
  }

  void loadHadethfile() {
    // try{
    //   String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    //
    // }catch(error){
    //   print(error);
    // }


    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String>AhadethContent = value.split("#");
      for (int i = 0; i < AhadethContent.length; i++) {
        int lastindex = AhadethContent[i].trim().indexOf("\n");
        String title = AhadethContent[i].trim().substring(0, lastindex);
        String content = AhadethContent[i].trim().substring(lastindex + 1);
        HadethModel hadethModel = HadethModel(title, content);
        allahadeth.add(hadethModel);
      }
      setState(() {});
    }).catchError(
            (Error) {
          print(Error);
        }
    );
  }
}
