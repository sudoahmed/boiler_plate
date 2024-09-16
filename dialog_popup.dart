import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markettoll/constants/colors/app_colors.dart';
import 'package:markettoll/screens/components/text_component.dart';
import 'package:markettoll/utils/utils.dart';

class DialogPopupComponent extends StatelessWidget with Utils {
  final String title;
  final String subTitle;
  final Function()? onYes;

  const DialogPopupComponent({
    super.key,
    required this.title,
    required this.subTitle,
    this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      title: TextComponent(
        text: title,
        fontsize: 15,
        fontWeight: FontWeight.w600,
      ),
      content: TextComponent(
        text: subTitle,
        fontsize: 13,
        fontWeight: FontWeight.w400,
      ),
      actionsPadding: EdgeInsets.only(bottom: 10.h),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: onYes ??
                  () {
                    Get.back();
                  },
              child: const TextComponent(
                text: 'Yes',
                fontsize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.coralRed,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero)),
              child: const TextComponent(
                text: 'No',
                color: AppColors.black,
                fontsize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
