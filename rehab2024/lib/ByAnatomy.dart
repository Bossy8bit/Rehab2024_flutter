import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'CustomButtonContainer.dart';
import 'CustomScaffold.dart';


class ByAnatomy extends StatelessWidget {
   final Function(Locale) changeLanguage;

  ByAnatomy({required this.changeLanguage});
  
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
              assetPath: 'lib/assets/svg_icons/head_button_icon9.svg',
              title: AppLocalizations.of(context)!.neck,
              routePath: '/profile',
              color: Color.fromRGBO(4, 123, 10, 1),
            ),
            
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon10.svg',
              title: AppLocalizations.of(context)!.shoulder, // Localized text
              routePath: '/patient',
              color: Color.fromRGBO(6, 219, 24, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon11.svg',
              title: AppLocalizations.of(context)!.arm, // Localized text
              routePath: '/svgimage',
              color: Color.fromRGBO(195, 179, 41, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon15.svg',
              title: AppLocalizations.of(context)!.back, // Localized text
              routePath: '/exercise-list',
              color: Color.fromRGBO(249, 130, 2, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon12.svg',
              title: AppLocalizations.of(context)!.waist, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(167, 29, 29, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon14.svg',
              title: AppLocalizations.of(context)!.knee, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(163, 3, 184, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon16.svg',
              title: AppLocalizations.of(context)!.ankle, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(3, 126, 241, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon16.svg',
              title: AppLocalizations.of(context)!.feet, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(3, 11, 239, 1),
            ),
                    ],
        ),
        )
      ),
    );
  }
}
