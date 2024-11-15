import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/_core/widgets/custom_shimmer.dart';

class LatestItem extends StatelessWidget {
  const LatestItem({
    super.key,
    required this.item,
    required this.isLast,
    required this.isFirst,
    required this.isLoading,
  });

  final Movie item;
  final bool isLast;
  final bool isFirst;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          if (isFirst) ...[
            const SizedBox(
              width: AppConstant.kDefaultPadding * 2,
            )
          ],
          CustomShimmer(
              height: 225, width: MediaQuery.sizeOf(context).width * 8 / 10),
        ],
      );
    }
    return Row(
      children: [
        if (isFirst) ...[
          const SizedBox(
            width: AppConstant.kDefaultPadding * 2,
          )
        ],
        Container(
          width: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.deepCharcoal,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${AppFlavor.instance.imgUrl}${item.backdropUrl}',
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstant.kDefaultPadding,
                      vertical: AppConstant.kDefaultSpacing),
                  child: Text(
                    '${item.title} (${item.releaseDate?.year})',
                    style: AppTextStyle.roboto18
                        .copyWith(color: AppColor.neutral1),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isLast) ...[
          const SizedBox(
            width: AppConstant.kDefaultPadding * 2,
          )
        ],
      ],
    );
  }
}
