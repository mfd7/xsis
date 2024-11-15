import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/presentation/home/widgets/search_item.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key, required this.movies, required this.onMovieTap});
  final List<Movie> movies;
  final Function(Movie) onMovieTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.8,
        crossAxisSpacing: AppConstant.kDefaultPadding,
        mainAxisSpacing: AppConstant.kDefaultPadding,
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
      itemBuilder: (context, index) {
        final item = movies.elementAt(index);
        return InkWell(
          onTap: () => onMovieTap(item),
          child: SearchItem(
            title: item.title,
            imageUrl: item.imageUrl,
            releaseDate: item.releaseDate ?? DateTime.now(),
          ),
        );
      },
    );
  }
}
