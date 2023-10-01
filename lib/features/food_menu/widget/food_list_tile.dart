// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kitwosd_restro_system/features/food_menu/widget/dialog_box.dart';
// import 'package:kitwosd_restro_system/widget/helper/function.dart';

// class FoodListTile extends StatefulWidget {
//   final String title;
//   final String? subtitle;
//   // final String dollar;
//   final String image;
//   final String? price;
//   const FoodListTile(
//       {super.key,
//       required this.title,
//       this.subtitle,
//       /*required this.dollar*/ required this.image,
//       required this.price});

//   @override
//   State<FoodListTile> createState() => _FoodListTileState();
// }

// class _FoodListTileState extends State<FoodListTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       dense: true,
//       visualDensity: const VisualDensity(vertical: 4),
//       leading: Container(
//           width: isTablet ? 100.h : 80.h,
//           height: isTablet ? 100.w : 80.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.r),
//             image: DecorationImage(
//                 image: AssetImage(
//                   widget.image,
//                 ),
//                 fit: BoxFit.fill),
//           )),
//       title: Text(widget.title,
//           style: TextStyle(
//             color: const Color(0xff020f06),
//             fontWeight: FontWeight.w300,
//             fontSize: isTablet ? 8.sp : 12.sp,
//           )),
//       subtitle: Text(
//         widget.subtitle!,
//         style: TextStyle(
//             color: const Color(0xff868686),
//             fontWeight: FontWeight.w400,
//             fontSize: isTablet ? 4.sp : 10.sp),
//       ),
//       trailing: Padding(
//         padding: EdgeInsets.only(
//           top: 10.h,
//         ),
//         child: Column(
//           children: [
//             Text(
//               widget.price!,
//               style: TextStyle(
//                   fontSize: isTablet ? 4.sp : 10.sp,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xff6f7773)),
//             ),
//             Expanded(
//               child: TextButton(
//                   onPressed: () {
//                     dialogBox(context,id);
//                   },
//                   child: const Text(
//                     'Add Item',
//                     style: TextStyle(
//                         color: Color(0xffF8B64C), fontWeight: FontWeight.w800),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
