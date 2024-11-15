import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/home/controllers/latest_widget_controller.dart';
import 'package:xsis/presentation/home/widgets/latest_item.dart';

class LatestWidget extends StatelessWidget {
  LatestWidget({
    super.key,
    required this.onMovieTap,
  });

  final _controller = Get.find<LatestWidgetController>();
  final Function(Movie) onMovieTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.kDefaultPadding * 2),
          child: Text(
            'Latest',
            style: AppTextStyle.roboto22.copyWith(color: AppColor.neutral1),
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultSpacing * 2,
        ),
        Obx(
          () => SizedBox(
            height: 225,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _controller.latestMovies.length,
              itemBuilder: (context, index) {
                final item = _controller.latestMovies.elementAt(index);
                return InkWell(
                  onTap: () => onMovieTap(item),
                  child: LatestItem(
                    item: item,
                    isFirst: index == 0,
                    isLast: index == _controller.latestMovies.length - 1,
                    isLoading: _controller.isLoading.value,
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: AppConstant.kDefaultPadding * 2,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
