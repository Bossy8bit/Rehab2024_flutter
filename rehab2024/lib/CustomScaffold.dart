import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar appBar;
  final Function(Locale) changeLanguage;

  CustomScaffold({
    required this.body,
    required this.appBar,
    required this.changeLanguage,
  });

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.mainpage),
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
          icon: Row(
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
            _buildDropdownMenuItem(Locale('en'), '🇺🇸', 'English'),
            _buildDropdownMenuItem(Locale('th'), '🇹🇭', 'ไทย'),
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
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              AppLocalizations.of(context)!.menu,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            // title: Text('หน้าหลัก'),
            title: Text(AppLocalizations.of(context)!.mainpage),
            onTap: () {
              Navigator.pop(context);
              context.go('/'); // นำทางไปที่หน้าหลัก
            },
          ),
          ListTile(
            leading: Icon(Icons.details),
            // title: Text('รายละเอียด'),
            title: Text(AppLocalizations.of(context)!.details),
            onTap: () {
              Navigator.pop(context);
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
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
