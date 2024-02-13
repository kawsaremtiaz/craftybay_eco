// import 'package:craftybay/presentation/ui/utility/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class QuantitySelector extends StatefulWidget {
//   const QuantitySelector({super.key, required this.quantity, required this.onChange});
//
//   final List<String> quantity;
//   final Function onChange;
//
//   @override
//   State<QuantitySelector> createState() => _QuantitySelectorState();
// }
//
// class _QuantitySelectorState extends State<QuantitySelector> {
//   late int _selecteQuantity;
//   @override
//   void initState() {
//     super.initState();
//     _selecteQuantity = widget.quantity.;
//     widget.onChange(_selecteQuantity);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//             height: 24,
//             width: 30,
//             decoration: BoxDecoration(
//                 color: CraftyBayAppColors.primaryColor,
//                 borderRadius: BorderRadius.circular(5),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 10,
//                   )
//                 ]),
//             child: IconButton(
//               onPressed: () {
//                 _selecteQuantity = 1;
//
//               },
//               icon: const Icon(
//                 CupertinoIcons.plus,
//                 size: 10,
//                 color: Colors.white,
//               ),
//             )),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text("1",
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//         ),
//         Container(
//           height: 24,
//           width: 30,
//           decoration: BoxDecoration(
//               color: CraftyBayAppColors.primaryColor,
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 10,
//                 )
//               ]),
//           child: IconButton(
//             onPressed: () {
//
//             },
//             icon: const Icon(
//               CupertinoIcons.minus,
//               size: 10,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//     //   Row(
//     //   children: widget.quantity
//     //       .map((s) => InkWell(
//     //     borderRadius: BorderRadius.circular(50),
//     //     onTap: () {
//     //       _selecteQuantity = s;
//     //       widget.onChange(s);
//     //       if (mounted) {
//     //         setState(() {});
//     //       }
//     //     },
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(4.0),
//     //       child: Container(
//     //         height: 40,
//     //         width: 40,
//     //         decoration: BoxDecoration(
//     //             borderRadius: BorderRadius.circular(20),
//     //             border:
//     //             Border.all(color: CraftyBayAppColors.primaryColor),
//     //             color: s == _selecteQuantity
//     //                 ? CraftyBayAppColors.primaryColor
//     //                 : Colors.transparent),
//     //         child: Center(
//     //             child: Text(
//     //               s,
//     //               style: TextStyle(
//     //                   color:
//     //                   s == _selecteQuantity ? Colors.white : Colors.grey,
//     //                   fontSize: 10),
//     //             )),
//     //       ),
//     //     ),
//     //   ))
//     //       .toList(),
//     // );
//   }
// }