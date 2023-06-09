import 'package:flutter/material.dart';
import 'package:islame_application/tabs/ahadeth.dart';
import 'package:islame_application/tabs/quran.dart';
import 'package:islame_application/tabs/radio.dart';
import 'package:islame_application/tabs/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame_application/tabs/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [QurabTab(), SebhaTab(), RadioTab(), AhadethTab(),SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            Theme.of(context).colorScheme.brightness==Brightness.light?"assets/images/main_bg.png":"assets/images/dark_main_bg.png",
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title:
                Text(AppLocalizations.of(context)!.apptitle, style: Theme.of(context).textTheme.titleSmall),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                  backgroundColor: Theme.of(context).primaryColor),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }
}
