import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab2024/HomeScreen.dart';


// ignore: must_be_immutable
class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar appBar;
  final Function(Locale) changeLanguage;

  CustomScaffold({super.key, 
    required this.body,
    required this.appBar,
    required this.changeLanguage,
  });
  
  Locale currentLocale = const Locale('en');// Current locale for the dropdown (assume English is default)
  
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
       title: GestureDetector(
          onTap: () {
            // Navigate to another page when the icon is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(changeLanguage: changeLanguage,)),
            );
          },
          child: const Icon(Icons.home, size: 50.0, color: Colors.white), // Change the icon here
        ),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: [
        _buildLanguageDropdown(), // เพิ่ม dropdown เพื่อเลือกภาษา
      ],
    ),

    drawer: _buildDrawer(context), // Add the drawer here
    body: body,
  );
}


  Widget _buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          icon: const Row(
            children: [
              Icon(Icons.language, color: Colors.white),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
            
          ),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              changeLanguage(newLocale); // เรียกใช้ฟังก์ชัน changeLanguage เพื่อเปลี่ยนภาษา
            }
          },
          items: [
            _buildDropdownMenuItem(const Locale('en'), '🇺🇸', 'English'),
            _buildDropdownMenuItem(const Locale('th'), '🇹🇭', 'ไทย'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Text(
              AppLocalizations.of(context)!.menu,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            // title: Text('หน้าหลัก'),
            title: Text(AppLocalizations.of(context)!.mainpage),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst); 
              context.go('/'); // นำทางไปที่หน้าหลัก
            },
          ),
          ListTile(
            leading: const Icon(Icons.details),
            // title: Text('รายละเอียด'),
            title: Text(AppLocalizations.of(context)!.details),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst); 
              context.go('/details'); // นำทางไปที่หน้ารายละเอียด
            },
          ),
          // สามารถเพิ่มรายการอื่น ๆ ได้ตามต้องการ
        ],
      ),
    );
  }

  DropdownMenuItem<Locale> _buildDropdownMenuItem(Locale locale, String flag, String text) {
    return DropdownMenuItem(
      value: locale,
      child: Row(
        children: [
          Text(flag),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
