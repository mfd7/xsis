import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/presentation/_core/app_color.dart';

class DotNavigation extends StatelessWidget {
  const DotNavigation({
    super.key,
    this.isSelected = false,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.kDefaultSpacing / 2),
      height: isSelected ? 10 : 8,
      width: isSelected ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColor.cinematicRed : AppColor.neutral1,
      ),
    );
  }
}
