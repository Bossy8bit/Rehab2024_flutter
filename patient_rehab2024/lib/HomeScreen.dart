
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
            //  CustomButtonContainer(
            //   assetPath:'lib/assets/svg_icons/QRcode.svg',
            //   title: AppLocalizations.of(context)!.qrCode, // Localized text
            //   routePath: '/qrcode',
            //   color:Color.fromRGBO(128, 194, 214, 1),
            // ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/icon_help_4.svg',
              title: AppLocalizations.of(context)!.ratingScreen, // Localized text
              routePath: '/ratingscreen',
              color:Color.fromRGBO(128, 194, 214, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/icon_help_6.svg',
              title: AppLocalizations.of(context)!.myPrescription, // Localized text
              routePath: '/ratingscreen',
              color:Color.fromRGBO(128, 194, 214, 1),
            ),
             CustomButtonContainer(
              assetPath:'lib/assets/svg_icons/icon_help_3.svg',
              title: AppLocalizations.of(context)!.myProgress, // Localized text
              routePath: '/ratingscreen',
              color:Color.fromRGBO(128, 194, 214, 1),
            ),
            
            
            
            
                    ],
        ),
        )
      ),
    );
  }
}
