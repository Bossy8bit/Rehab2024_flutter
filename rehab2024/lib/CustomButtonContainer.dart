// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';


// class CustomButtonContainer extends StatelessWidget {
//   final String assetPath;
//   final String routePath;
//   final String title; // Added title parameter for the container
//   final double? width;
//   final double? height;
//   final Color? color;

//   const CustomButtonContainer({
//     Key? key,
//     required this.assetPath, // Path to the SVG file
//     required this.routePath, // Route to navigate to
//     required this.title, // Title for the button/container
//     this.width, // Optional width
//     this.height, // Optional height
//     this.color, // Optional color filter
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0), // Space around the button
//       padding: const EdgeInsets.all(16.0), // Padding for the content
//       decoration: BoxDecoration(
//         color: Colors.blue, // Background color
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1), // Shadow color
//             blurRadius: 6,
//             offset: const Offset(0, 3), // Shadow offset
//           ),
//         ],
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12), // Match the container's corners
//         onTap: () {
//           context.push(routePath); // Navigate to the specified route
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               assetPath, // Path to SVG
//               width: width ?? 60.0, // Default width
//               height: height ?? 60.0, // Default height
//               color: color ?? Colors.white, // Default color
//             ),

//             Expanded(
//               child: Text(
//                 title, // Display the title dynamically
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomButtonContainer extends StatelessWidget {
  final String assetPath; // Path to the SVG icon
  final String routePath; // Navigation route
  final String title; // Title text
  final Color? color; // Background color
  final double? width; // Custom width for the container
  final double? height; // Custom height for the container

  const CustomButtonContainer({
    Key? key,
    required this.assetPath,
    required this.routePath,
    required this.title,
    this.color = Colors.blue, // Default background color
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width; // Screen width
    final double screenHeight = MediaQuery.of(context).size.height; // Screen height

    return Container(
      width: width ?? screenWidth * 0.9, // Default to 90% of screen width
      height: height ?? screenHeight * 0.15, // Default to 15% of screen height
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Vertical spacing
      padding: const EdgeInsets.all(16.0), // Inner padding
      decoration: BoxDecoration(
        color: color, // Background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 6, // Blur intensity
            offset: const Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12), // Match container's corners
        onTap: () {
          context.push(routePath); // Navigate to the specified route
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
          children: [
            // SVG Icon
            SvgPicture.asset(
              assetPath, // Path to SVG
              width: screenHeight * 0.08, // Icon width proportional to screen height
              height: screenHeight * 0.08, // Icon height proportional to screen height
              color: Colors.white, // Icon color
            ),
            const SizedBox(width: 16), // Space between icon and text
            // Title Text
            Expanded(
              child: Text(
                title, // Display the title dynamically
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 36, // Font size
                  fontWeight: FontWeight.bold, // Bold font
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
