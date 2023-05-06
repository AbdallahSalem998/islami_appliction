import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islame_application/providers/my_provider.dart';
import 'package:islame_application/showLanguageSheetWidget.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap: () {
              showLanguageSheet(context);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  provider.languageCode=="ar"?"Arabic":"English",
                  style: GoogleFonts.elMessiri(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Text(
            "theme",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "dark",
                style: GoogleFonts.elMessiri(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowLanguageSheetWidget();
      },
    );
  }
}
