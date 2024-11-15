import 'package:flutter/material.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/_core/widgets/custom_shimmer.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.isLoading,
  });

  final String title;
  final bool isSelected;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CustomShimmer(height: 20, width: MediaQuery.sizeOf(context).width);
    }
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: !isSelected ? AppColor.neutral1 : AppColor.cinematicRed,
                width: 2),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.roboto12.copyWith(
                color: !isSelected ? AppColor.neutral1 : AppColor.cinematicRed,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
