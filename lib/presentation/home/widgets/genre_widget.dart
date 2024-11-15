import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/home/controllers/genre_widget_controller.dart';
import 'package:xsis/presentation/home/widgets/genre_chip.dart';
import 'package:xsis/presentation/home/widgets/genre_item.dart';

class GenreWidget extends StatelessWidget {
  GenreWidget({super.key, required this.onMovieTap});
  final _controller = Get.find<GenreWidgetController>();
  final Function(Movie) onMovieTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 70,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.kDefaultPadding),
              itemCount: _controller.genreList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _controller.genreList.elementAt(index);
                return Obx(
                  () => GenreChip(
                    title: item.name,
                    isSelected: _controller.selectedGenreIdx.value == index,
                    onTap: () => _controller.changeGenre(index),
                    isLoading: _controller.isGenreLoading.value,
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: AppConstant.kDefaultPadding,
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultSpacing * 2,
        ),
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            itemCount: _controller.movieByGenre.value.movies.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.8,
              crossAxisSpacing: AppConstant.kDefaultPadding,
              mainAxisSpacing: AppConstant.kDefaultPadding,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.kDefaultPadding),
            itemBuilder: (context, index) {
              final item =
                  _controller.movieByGenre.value.movies.elementAt(index);
              return Obx(
                () => InkWell(
                  onTap: () => onMovieTap(item),
                  child: GenreItem(
                    title: item.title,
                    imageUrl: item.imageUrl,
                    releaseDate: item.releaseDate ?? DateTime.now(),
                    isLoading: _controller.isLoading.value,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultSpacing * 2,
        ),
        const Center(
          child: CircularProgressIndicator(
            color: AppColor.cinematicRed,
          ),
        ),
        const SizedBox(
          height: AppConstant.kDefaultSpacing * 5,
        ),
      ],
    );
  }
}
