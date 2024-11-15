import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xsis/presentation/_core/app_color.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.steelBlueGray,
      highlightColor: AppColor.softSilver,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.steelBlueGray,
        ),
      ),
    );
  }
}
