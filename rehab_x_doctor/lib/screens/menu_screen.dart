import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'exercise_screen.dart';
import 'exercise_list_screen.dart';
import 'qr_scanner_screen.dart';
import 'about_us_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/appicon.png',
          width: 40,
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(Icons.flag, color: Colors.white),
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('🇺🇸')),
                  DropdownMenuItem(value: 'th', child: Text('🇹🇭')),
                ],
                onChanged: (value) {},
                value: 'en',
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.menu, size: 32),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: 'Close menu',
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu_book, size: 32),
              title: Text('Application Tutorial', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, size: 32),
              title: Text('About Us', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRScannerScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon5.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        const SizedBox(height: 8),
                        const Text('ข้อมูลหมอ', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExerciseListScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon1.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('รายชื่อผู้ป่วย', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 41, 239),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExerciseListScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon2.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('รายการท่าโปรด', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 10, 212),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ExerciseScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon3.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('รายการท่า', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24), // Extra bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
