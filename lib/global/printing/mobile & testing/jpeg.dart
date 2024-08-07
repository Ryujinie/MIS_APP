// // ignore_for_file: avoid_print

// import 'dart:io';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider_windows/path_provider_windows.dart';

// final GlobalKey _repaintBoundaryKey = GlobalKey();

// Future<void> captureAndGenerateImage() async {
//   try {
//     await Future.delayed(const Duration(milliseconds: 100));
//     final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
//         as RenderRepaintBoundary?;
//     if (boundary != null) {
//       final image = await boundary.toImage();
//       final byteData = await image.toByteData(format: ImageByteFormat.png);
//       if (byteData != null) {
//         final buffer = byteData.buffer;
//         final imageBytes = buffer.asUint8List();

//         final documentsPath = await getDocumentsPath();
//         if (documentsPath != null && documentsPath.isNotEmpty) {
//           final file = File('$documentsPath/my_image.png');
//           await file.writeAsBytes(imageBytes);
//           print('Image saved to $documentsPath/my_image.png');
//         } else {
//           print('Failed to get documents path');
//         }
//       } else {
//         print('Failed to convert image to byte data');
//       }
//     } else {
//       print('Failed to get boundary');
//     }
//   } catch (e) {
//     print('Error capturing image: $e');
//   }
// }

// // Define constants (assuming you have these defined somewhere in your code)
// // class Constants {
// //   static const adminBtn = Colors.blue;
// //   static const mainTextWhite = Colors.white;
// // }

// // final constants = Constants();

// Future<String?> getDocumentsPath() async {
//   try {
//     final PathProviderWindows provider = PathProviderWindows();
//     final String? documentsPath = await provider.getApplicationDocumentsPath();
//     return documentsPath;
//   } catch (e) {
//     print('Error getting documents path: $e');
//     return null;
//   }
// }

// // Future<void> generateJpegImage(String data) async {
// //   final pictureRecorder = PictureRecorder();
// //   final canvas = Canvas(pictureRecorder);

// //   // Example drawing logic
// //   final textPainter = TextPainter(
// //     text: TextSpan(
// //       text: data,
// //       style: const TextStyle(color: Colors.black, fontSize: 40),
// //     ),
// //     textDirection: TextDirection.ltr,
// //   );
// //   textPainter.layout(minWidth: 0, maxWidth: 800);
// //   textPainter.paint(canvas, const Offset(0, 0));
  

// //   final picture = pictureRecorder.endRecording();
// //   final image =
// //       await picture.toImage(800, 600); // Adjust width and height as needed

// //   final bytes = await image.toByteData(format: ImageByteFormat.png);

// //   if (bytes != null) {
// //     final buffer = bytes.buffer;
// //     final imageBytes = buffer.asUint8List();

// //     final documentsPath = await getDocumentsPath();
// //     if (documentsPath != null && documentsPath.isNotEmpty) {
// //       final file = File('$documentsPath/my_image.jpg');
// //       await file.writeAsBytes(imageBytes);
// //     } else {
// //       print('Failed to get documents path');
// //     }
// //   } else {
// //     print('Failed to convert image to byte data');
// //   }
// // }
