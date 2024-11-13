
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'CustomScaffold.dart';

class HomeScreen extends StatelessWidget {
   final Function(Locale) changeLanguage;

  HomeScreen({required this.changeLanguage});
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: changeLanguage,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/'); // นำทางไปที่หน้าhome
              },
              child:  Text(AppLocalizations.of(context)!.gotohome)
            ),

            SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                context.go('/star'); // นำทางไปที่หน้าstar
              },
              child: Text('ไปที่หน้าstar'),
            ),
            
            ],
          ),
        ),
      )
    );
  }
}
