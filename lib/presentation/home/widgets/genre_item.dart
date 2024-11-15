import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/_core/widgets/custom_shimmer.dart';

class GenreItem extends StatelessWidget {
  const GenreItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.releaseDate,
      required this.isLoading});

  final String title;
  final String imageUrl;
  final DateTime releaseDate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CustomShimmer(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width);
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyle.roboto18.copyWith(color: AppColor.neutral1),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultPadding / 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${releaseDate.year}',
            style: AppTextStyle.roboto12.copyWith(color: AppColor.neutral1),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultPadding / 4 * 3,
        ),
        AspectRatio(
          aspectRatio: 0.7,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
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
          ),
        ),
      ],
    );
  }
}
