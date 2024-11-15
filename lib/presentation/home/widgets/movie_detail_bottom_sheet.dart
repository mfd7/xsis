import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/_core/widgets/custom_shimmer.dart';
import 'package:xsis/presentation/home/controllers/movie_detail_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailBottomSheet extends StatelessWidget {
  MovieDetailBottomSheet({super.key, required this.movie}) {
    _controller =
        Get.put(MovieDetailController(Get.find(), Get.find(), movie.id));
  }

  final Movie movie;
  late final MovieDetailController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppConstant.kDefaultPadding * 3),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.coolDarkBlue,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppConstant.kDefaultPadding,
                        top: AppConstant.kDefaultSpacing),
                    child: Text(
                      movie.title,
                      style: AppTextStyle.roboto22
                          .copyWith(color: AppColor.neutral1),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.neutral1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppConstant.kDefaultSpacing * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.kDefaultPadding),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_controller.isGenreLoading.value) ...[
                      const CustomShimmer(height: 20, width: double.infinity),
                    ] else ...[
                      Text(
                        movie.genreIds
                            .map((e) => _controller.genreList
                                .firstWhere((element) => element.id == e)
                                .name)
                            .toList()
                            .join(', '),
                        style: AppTextStyle.roboto18
                            .copyWith(color: AppColor.neutral1),
                      ),
                    ],
                    const SizedBox(
                      height: AppConstant.kDefaultSpacing * 2,
                    ),
                    if (_controller.videoController.value == null) ...[
                      const CustomShimmer(height: 300, width: double.infinity),
                    ] else ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: YoutubePlayer(
                          controller: _controller.videoController.value!,
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: AppConstant.kDefaultSpacing * 2,
                    ),
                    Text(
                      movie.overview,
                      style: AppTextStyle.roboto12
                          .copyWith(color: AppColor.neutral1),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
