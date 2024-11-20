
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'CustomButtonContainer.dart';
import 'CustomScaffold.dart';



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
        child:SingleChildScrollView(
        child: Column(
             
          children: [
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon5.svg',
              title: AppLocalizations.of(context)!.myProfile,
              routePath: '/profile',
              color: Color.fromRGBO(128, 194, 214, 1),
            ),
            
            CustomButtonContainer(
              assetPath: 'lib/assets/svg_icons/head_button_icon7.svg',
              title: AppLocalizations.of(context)!.myPatients, // Localized text
              routePath: '/patient',
              color: Color.fromRGBO(226, 148, 203, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon2.svg',
              title: AppLocalizations.of(context)!.favoriteExercise, // Localized text
              routePath: '/favorite',
              color: Color.fromRGBO(223, 175, 100, 1),
            ),
            CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/head_button_icon3.svg',
              title: AppLocalizations.of(context)!.exerciseList, // Localized text
              routePath: '/exercise-list',
              color: Color.fromRGBO(160, 158, 245, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/by_symptom_icon1.svg',
              title: AppLocalizations.of(context)!.qrCode, // Localized text
              routePath: '/qrcode',
              color:Color.fromRGBO(128, 194, 214, 1),
            ),
            
            
            
            
                    ],
        ),
        )
      ),
    );
  }
}
