import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CraftyBay());
}
//
//
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   bool isButtonEnabled = true;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Enable/Disable Button Example'),
// //         ),
// //         body: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               ElevatedButton(
// //                 onPressed: isButtonEnabled ? () => _handleButtonPress() : null,
// //                 child: Text('Click me'),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //
// //                     isButtonEnabled = !isButtonEnabled;
// //                   });
// //                 },
// //                 child: Text('Toggle Button'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _handleButtonPress() {
// //
// //     print('Button pressed!');
// //   }
// // }
//


// import 'dart:async';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isButtonEnabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Enable/Disable Button with Timer Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: isButtonEnabled ? () => _handleButtonPress() : null,
//                 child: Text('Click me'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Start a timer to enable the button after 5 seconds
//                   Timer(Duration(seconds: 5), () {
//                     setState(() {
//                       isButtonEnabled = true;
//                     });
//                   });
//                   // Disable the button immediately
//                   setState(() {
//                     isButtonEnabled = false;
//                   });
//                 },
//                 child: Text('Disable Button for 5 seconds'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleButtonPress() {
//     // Handle button press action here
//     print('Button pressed!');
//   }
// }
