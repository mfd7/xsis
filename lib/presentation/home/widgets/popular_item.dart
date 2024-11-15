import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/_core/widgets/custom_shimmer.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.isLoading,
  });

  final String imageUrl;
  final String title;
  final String desc;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CustomShimmer(
          height: 300, width: MediaQuery.sizeOf(context).width);
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.deepCharcoal,
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 150,
            fit: BoxFit.cover,
            imageUrl: '${AppFlavor.instance.imgUrl}$imageUrl',
            progressIndicatorBuilder: (_, url, __) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.cinematicRed,
                ),
              );
            },
            errorWidget: (_, error, __) {
              return Center(
                child: Text(
                  error,
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.kDefaultPadding,
                  vertical: AppConstant.kDefaultSpacing),
              child: Column(
                children: [
                  Text(
                    title,
                    style: AppTextStyle.roboto18
                        .copyWith(color: AppColor.neutral1),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppConstant.kDefaultSpacing / 2,
                  ),
                  Expanded(
                    child: Text(
                      desc,
                      style: AppTextStyle.roboto12.copyWith(
                        color: AppColor.smokeGray,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
