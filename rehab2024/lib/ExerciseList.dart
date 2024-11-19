
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'CustomScaffold.dart';
// import 'MenuButton.dart';

// class Exerciselist extends StatelessWidget {
//    final Function(Locale) changeLanguage;

//   Exerciselist({required this.changeLanguage});
  
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       changeLanguage: changeLanguage,
//       appBar: AppBar(),
//       body:  Container(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//               MenuButton(
//               icon: Icons.search, 
//               text: AppLocalizations.of(context)!.exerciseList, // Localized text
//               color: Color.fromRGBO(129, 194, 214, 1), 
//               routePath: '/exercise-list'
//             ),
//             MenuButton(
//               icon: Icons.people, 
//               text: AppLocalizations.of(context)!.byAnatomy, // Localized text
//               color: Color.fromRGBO(225, 148, 203, 1), 
//               routePath: '/patients'
//             ),
//             MenuButton(
//               icon: Icons.padding, 
//               text: AppLocalizations.of(context)!.bySymtoms, // Localized text
//               color: Color.fromRGBO(223, 176, 99, 1), 
//               routePath: '/favorite-exercise'
//             ),
//             MenuButton(
//               icon: Icons.star, 
//               text: AppLocalizations.of(context)!.byFavorite, // Localized text
//               color: const Color.fromRGBO(159, 158, 245, 1), 
//               routePath: '/exercise-list'
//             ),
//             MenuButton(
//               icon: Icons.plus_one, 
//               text: AppLocalizations.of(context)!.addExercise, // Localized text
//               color: const Color.fromRGBO(129, 194, 214, 1), 
//               routePath: '/qr-code'
//             ),
//                     ],
//         ),
//       ),
//     );
//   }
// }


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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon5.svg',
              title: AppLocalizations.of(context)!.exerciseList,
              routePath: '/profile',
              color: Color.fromRGBO(135, 214, 139, 1),
            ),
            
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon7.svg',
              title: AppLocalizations.of(context)!.byAnatomy, // Localized text
              routePath: '/patient',
              color: Color.fromRGBO(191, 102, 177, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon6.svg',
              title: AppLocalizations.of(context)!.bySymtoms, // Localized text
              routePath: '/svgimage',
              color: Color.fromRGBO(216, 205, 101, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon2.svg',
              title: AppLocalizations.of(context)!.byFavorite, // Localized text
              routePath: '/exercise-list',
              color: Color.fromRGBO(223, 175, 100, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/by_symptom_icon1.svg',
              title: AppLocalizations.of(context)!.addExercise, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(1, 1, 1, 1),
            ),
            
                    ],
        ),
      ),
    );
  }
}
