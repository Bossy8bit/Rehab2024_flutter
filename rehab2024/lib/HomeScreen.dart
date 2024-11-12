
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab2024/CustomScaffold.dart';



class HomeScreen extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      title: 'หน้าหลัก',
      body: SingleChildScrollView(
        child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/'); // นำทางไปที่หน้าhome
              },
              child: Text('ไปที่หน้าHome'),
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
