import 'package:flutter/material.dart';
import 'package:rehab2024/CustomScaffold.dart';


class RatingWidget extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const RatingWidget({super.key, required this.changeLanguage});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}
class RatingScreen extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const RatingScreen({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: changeLanguage,
      appBar: AppBar(),
      body: RatingWidget(changeLanguage: changeLanguage), // ใช้ RatingWidget เป็น body ของ CustomScaffold
    );
  }
}
class _RatingWidgetState extends State<RatingWidget> {
  int firstRowRating = 0; // คะแนนสำหรับแถวที่ 1
  int secondRowRating = 0; // คะแนนสำหรับแถวที่ 2

  int firstRowSelectedIndex = 2; // ค่าเริ่มต้นของ selectedIndex สำหรับแถวที่ 1
  int secondRowSelectedIndex = 2; // ค่าเริ่มต้นของ selectedIndex สำหรับแถวที่ 2

  // ฟังก์ชันสำหรับแปลง selectedIndex เป็นระดับความพึงพอใจ
  String getSatisfactionLevel(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Very Dissatisfied";
      case 1:
        return "Dissatisfied";
      case 2:
        return "Unhappy";
      case 3:
        return "Somewhat Dissatisfied";
      case 4:
        return "Neutral";
      case 5:
        return "Somewhat Satisfied";
      case 6:
        return "Content";
      case 7:
        return "Satisfied";
      case 8:
        return "Very Satisfied";
      case 9:
        return "Extremely Satisfied";
      
      default:
        return "Neutral";
// Very Dissatisfied
// Dissatisfied
// Unhappy
// Somewhat Dissatisfied
// Neutral
// Somewhat Satisfied
// Content
// Satisfied
// Very Satisfied
// Extremely Satisfied
    }
  }

  // ฟังก์ชันสำหรับคำนวณสีของดาวตามระดับความพึงพอใจ
  Color getColor(int selectedIndex) {
    // ใช้ ColorTween สำหรับเปลี่ยนสีจากแดงไปเขียว
    return ColorTween(begin: Colors.red, end: Colors.green)
        .transform(selectedIndex / 4) ?? Colors.red;
  }
  
  void submitRatings() {
    // ดำเนินการเมื่อกดปุ่ม Submit
    print('First Row Rating: $firstRowSelectedIndex');
    print('Second Row Rating: $secondRowSelectedIndex');
    // คุณสามารถทำอย่างอื่นได้ที่นี่ เช่น ส่งข้อมูลไปยัง server
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ MediaQuery เพื่อปรับขนาดของไอคอนและขนาดตัวอักษรให้เป็น responsive
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 700 ? 40 : 24; // ปรับขนาดไอคอนตามความกว้างหน้าจอ
    double fontSize = screenWidth > 700 ? 26 : 18; // ปรับขนาดฟอนต์ตามความกว้างหน้าจอ

    // สร้างรายการดาวสำหรับแถวที่ 1
    final firstRowStars = List.generate(
      10,
      (int index) => StarIcon(
        selected: firstRowSelectedIndex >= index, // ตรวจสอบว่าสถานะ selected หรือไม่
        color: getColor(firstRowSelectedIndex), // ใช้ฟังก์ชัน getColor เพื่อกำหนดสีตาม selectedIndex
        onPressed: () {
          setState(() {
            firstRowSelectedIndex = index; // อัปเดต selectedIndex ของแถวที่ 1 เมื่อกดดาว
          });
        },
        iconSize: iconSize,
      ),
    );

    // สร้างรายการดาวสำหรับแถวที่ 2
    final secondRowStars = List.generate(
      10,
      (int index) => StarIcon(
        selected: secondRowSelectedIndex >= index, // ตรวจสอบว่าสถานะ selected หรือไม่
        color: getColor(secondRowSelectedIndex), // ใช้ฟังก์ชัน getColor เพื่อกำหนดสีตาม selectedIndex
        onPressed: () {
          setState(() {
            secondRowSelectedIndex = index; // อัปเดต selectedIndex ของแถวที่ 2 เมื่อกดดาว
          });
        },
        iconSize: iconSize,
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // ปรับ layout ตามขนาดของ constraints
        bool isLargeScreen = constraints.maxWidth > 700; // รองรับหน้าจอขนาดใหญ่ขึ้น เช่น iPhone 16 Plus

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // แถวที่ 1
              Text(
                getSatisfactionLevel(firstRowSelectedIndex), // แสดงระดับความพึงพอใจ
                style: TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: isLargeScreen ? 20 : 10), // ระยะห่างระหว่างระดับความพึงพอใจและดาว
              Wrap(
                spacing: isLargeScreen ? 6 : 3,
                children: firstRowStars, // กระจายรายการดาวสำหรับแถวที่ 1
              ),

              const SizedBox(height: 30), // ระยะห่างระหว่างแถวที่ 1 และแถวที่ 2

              // แถวที่ 2
              Text(
                getSatisfactionLevel(secondRowSelectedIndex), // แสดงระดับความพึงพอใจ
                style: TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: isLargeScreen ? 20 : 10), // ระยะห่างระหว่างระดับความพึงพอใจและดาว
              Wrap(
                spacing: isLargeScreen ? 6 : 3,
                children: secondRowStars, // กระจายรายการดาวสำหรับแถวที่ 2
              ),

              const SizedBox(height: 30), // ระยะห่างระหว่างแถวที่ 2 และปุ่ม Submit

              // ปุ่ม Submit หนึ่งอันสำหรับทั้งสองแถว
              ElevatedButton(
                onPressed: submitRatings, // เรียกฟังก์ชัน submitRatings เมื่อกดปุ่ม
                child: const Text("Submit Rating"),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StarIcon extends StatelessWidget {
  final bool selected;
  final Color color;
  final VoidCallback onPressed;
  final double iconSize;

  const StarIcon({super.key, 
    required this.selected,
    required this.color,
    required this.onPressed,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        selected ? Icons.star : Icons.star_border,
        color: color,
        size: iconSize, // กำหนดขนาดไอคอนตาม iconSize
      ),
      onPressed: onPressed,
    );
  }
}


