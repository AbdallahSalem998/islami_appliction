import 'package:flutter/material.dart';
import 'package:islame_application/my_theme.dart';
import 'package:islame_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeSheetWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      color: provider.themeMode==ThemeMode.light?Colors.white:Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Light",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: provider.themeMode!=ThemeMode.light?Colors.grey:Theme.of(context).primaryColor
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: provider.themeMode!=ThemeMode.light?Colors.grey:Theme.of(context).primaryColor,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: provider.themeMode==ThemeMode.light?Colors.black54:Theme.of(context).colorScheme.onBackground,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Dark",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          color:provider.themeMode==ThemeMode.light?Colors.black54:MyThemeData.yellowColor
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color:provider.themeMode==ThemeMode.light?Colors.black54:MyThemeData.yellowColor,
                      size: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
