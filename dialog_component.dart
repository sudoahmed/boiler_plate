// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:markettoll/utils/utils.dart';

// class DialogComponent extends StatelessWidget with Utils {
//   final String title;
//   final String subTitle;
//   final Function()? onYes;

//   const DialogComponent({
//     super.key,
//     required this.title,
//     required this.subTitle,
//     this.onYes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           alignment: Alignment.center,
//           height: isTablet(context) ? 200.h : 170.h,
//           width: 271.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12.r),
//             gradient: const LinearGradient(
//               begin: Alignment(0.00, -1.00),
//               end: Alignment(0, 1),
//               colors: [Color(0xFFD696DF), Color(0xFFABFFDE)],
//             ),
//           ),
//           padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: Fonts.noto(
//                   context,
//                   AppColors.black,
//                   15.sp,
//                   FontWeight.w600,
//                 ),
//               ),
//               VerticalSpacing(10.h),
//               Text(
//                 subTitle,
//                 style: Fonts.noto(
//                   context,
//                   AppColors.black,
//                   13.sp,
//                   FontWeight.w400,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: onYes ??
//                         () {
//                           Get.back();
//                         },
//                     child: Text(
//                       'Yes',
//                       style: Fonts.noto(
//                           context, AppColors.errorRed, 15.sp, FontWeight.w600),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all(EdgeInsets.zero)),
//                     child: Text(
//                       'No',
//                       style: Fonts.noto(
//                           context, AppColors.black, 15.sp, FontWeight.w600),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
