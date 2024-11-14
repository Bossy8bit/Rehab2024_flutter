import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final String routePath;

  const MenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.routePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.go(routePath); // Navigate to the specified route path
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 42),
               
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
