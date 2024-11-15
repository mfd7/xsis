import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/home/controllers/popular_widget_controller.dart';
import 'package:xsis/presentation/home/widgets/dot_navigation.dart';
import 'package:xsis/presentation/home/widgets/popular_item.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget({super.key, required this.onMovieTap});
  final _controller = Get.find<PopularWidgetController>();
  final Function(Movie) onMovieTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CarouselSlider.builder(
            itemCount: _controller.nowPlaying.length,
            itemBuilder: (context, index, _) {
              final item = _controller.nowPlaying.elementAt(index);
              return InkWell(
                onTap: () => onMovieTap(item),
                child: PopularItem(
                  imageUrl: item.imageUrl,
                  title: '${item.title} (${item.releaseDate?.year})',
                  desc: item.overview,
                  isLoading: _controller.isLoading.value,
                ),
              );
            },
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (val, _) {
                  _controller.changeIndex(val);
                }),
          ),
          const SizedBox(
            height: AppConstant.kDefaultSpacing * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _controller.nowPlaying.length,
              (index) => DotNavigation(
                isSelected: _controller.index.value == index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
