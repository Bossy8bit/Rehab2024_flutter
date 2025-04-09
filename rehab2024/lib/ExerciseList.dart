
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'CustomButtonContainer.dart';
import 'CustomScaffold.dart';


class Exerciselist extends StatelessWidget {
   final Function(Locale) changeLanguage;

  Exerciselist({required this.changeLanguage});
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: changeLanguage,
      appBar: AppBar(),
      body:  Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/Magnifying glasss.svg',
              title: AppLocalizations.of(context)!.exerciseList,
              routePath: '/exercise-list',
              color: Color.fromRGBO(135, 214, 139, 1),
            ),
            
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon7.svg',
              title: AppLocalizations.of(context)!.byAnatomy, // Localized text
              routePath: '/byanatomy',
              color: Color.fromRGBO(191, 102, 177, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon6.svg',
              title: AppLocalizations.of(context)!.bySymtoms, // Localized text
              routePath: '/bysymtom',
              color: Color.fromRGBO(216, 205, 101, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon2.svg',
              title: AppLocalizations.of(context)!.byFavorite, // Localized text
              routePath: '/byfavorite',
              color: Color.fromRGBO(223, 175, 100, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/plus.svg',
              title: AppLocalizations.of(context)!.addExercise, // Localized text
              routePath: '/addexercise',
              color:Color.fromRGBO(1, 1, 1, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/plus.svg',
              title: AppLocalizations.of(context)!.addExercise, // Localized text
              routePath: '/exercisecard',
              color:Color.fromRGBO(255, 255, 1, 1),
            ),
            
            
                    ],
        ),
        )
      ),
    );
  }
}
