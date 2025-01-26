

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'CustomButtonContainer.dart';
import 'CustomScaffold.dart';


class BySymtom extends StatelessWidget {
   final Function(Locale) changeLanguage;

  BySymtom({required this.changeLanguage});
  
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
              assetPath: 'lib/assets/svg_icons/by_symptom_icon1.svg',
              title: "FrozenSholder",//AppLocalizations.of(context)!.exerciseList,
              routePath: '/profile',
              color: Color.fromRGBO(15, 175, 23, 1),
            ),
            
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/by_symptom_icon2.svg',
              title: "Low Back Pain",//AppLocalizations.of(context)!.byAnatomy, // Localized text
              routePath: '/patient',
              color: Color.fromRGBO(243, 180, 5, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/by_symptom_icon3.svg',
              title: "OA Knee",//AppLocalizations.of(context)!.bySymtoms, // Localized text
              routePath: '/svgimage',
              color: Color.fromRGBO(173, 45, 164, 1),
            ),
                    ],
        ),
        )
      ),
    );
  }
}
