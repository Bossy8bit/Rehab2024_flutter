
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final Widget body;

 CustomScaffold({required this.title, required this.body, required AppBar appBar});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  Locale _locale = Locale('en'); // กำหนดค่าเริ่มต้นเป็นภาษาอังกฤษ

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _locale,
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context), // เพิ่ม Drawer ที่นี่
        body: widget.body,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      // title: Text(AppLocalizations.of(context)!.homeTitle),
      title: Icon(Icons.auto_awesome_motion),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: [
        _buildLanguageDropdown(),
      ],
    );
  }

  Widget _buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          icon: Row(
            children: [
              Text(
                _getFlagEmoji(_locale.languageCode), // ใช้ฟังก์ชัน _getFlagEmoji() ในการเลือกธง
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              _changeLanguage(newLocale);
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

  // ฟังก์ชันที่คืนค่า Emoji ของธงตามรหัสภาษา
  String _getFlagEmoji(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇺🇸'; // ธงอเมริกา สำหรับภาษาอังกฤษ
      case 'th':
        return '🇹🇭'; // ธงไทย สำหรับภาษาไทย
      default:
        return '🌐'; // ธงโลก สำหรับภาษาที่ไม่รู้จัก
    }
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'เมนู',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            onTap: () {
              Navigator.pop(context);
              context.go('/'); // นำทางไปที่หน้าหลัก
            },
          ),
          ListTile(
            leading: Icon(Icons.details),
            title: Text('รายละเอียด'),
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
}

