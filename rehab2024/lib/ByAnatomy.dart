
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'CustomScaffold.dart';
// import 'MenuButton.dart';

// class ByAnatomy extends StatelessWidget {
//    final Function(Locale) changeLanguage;

//   ByAnatomy({required this.changeLanguage});
  
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
//               child: SvgPicture.asset(
//                     'assets/icons/my_icon.svg',
//                       width: 24,
//                       height: 24,
//                     ), 
//               text: AppLocalizations.of(context)!.addExercise, // Localized text
//               color: const Color.fromRGBO(129, 194, 214, 1), 
//               routePath: '/qr-code'
//             ),
//             MenuButton(
//               icon: Icons.plus_one, 
//               text: AppLocalizations.of(context)!.addExercise, // Localized text
//               color: const Color.fromRGBO(129, 194, 214, 1), 
//               routePath: '/qr-code'
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
