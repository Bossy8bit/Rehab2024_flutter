
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'CustomScaffold.dart';
import 'MenuButton.dart';

class HomeScreen extends StatelessWidget {
   final Function(Locale) changeLanguage;

  HomeScreen({required this.changeLanguage});
  
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
              MenuButton(
              icon: Icons.person, 
              text: AppLocalizations.of(context)!.myProfile, // Localized text
              color: Color.fromRGBO(129, 194, 214, 1), 
              routePath: '/profile'
            ),
            MenuButton(
              icon: Icons.people, 
              text: AppLocalizations.of(context)!.myPatients, // Localized text
              color: Color.fromRGBO(225, 148, 203, 1), 
              routePath: '/patients'
            ),
            MenuButton(
              icon: Icons.star, 
              text: AppLocalizations.of(context)!.favoriteExercise, // Localized text
              color: Color.fromRGBO(223, 176, 99, 1), 
              routePath: '/favorite-exercise'
            ),
            MenuButton(
              icon: Icons.fitness_center, 
              text: AppLocalizations.of(context)!.exerciseList, // Localized text
              color: const Color.fromRGBO(159, 158, 245, 1), 
              routePath: '/exercise-list'
            ),
            MenuButton(
              icon: Icons.qr_code, 
              text: AppLocalizations.of(context)!.qrCode, // Localized text
              color: const Color.fromRGBO(129, 194, 214, 1), 
              routePath: '/qr-code'
            ),
                    ],
        ),
      ),
    );
  }
}
