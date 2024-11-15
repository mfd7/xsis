import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/presentation/_core/app_color.dart';
import 'package:xsis/presentation/_core/app_text_style.dart';
import 'package:xsis/presentation/home/controllers/home_controller.dart';
import 'package:xsis/presentation/home/widgets/genre_widget.dart';
import 'package:xsis/presentation/home/widgets/latest_widget.dart';
import 'package:xsis/presentation/home/widgets/popular_widget.dart';
import 'package:xsis/presentation/home/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColor.primary,
        appBar: AppBar(
          backgroundColor: AppColor.coolDarkBlue,
          iconTheme: const IconThemeData(color: AppColor.neutral1),
          title: _controller.isSearching.value
              ? null
              : Text(
                  'Netplix',
                  style: AppTextStyle.calligraphy24
                      .copyWith(color: AppColor.neutral1),
                ),
          actions: [
            AnimatedCrossFade(
              firstChild: Row(
                children: [
                  TapRegion(
                    onTapOutside: (event) {
                      _controller.searchFocusNode.unfocus();
                    },
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 7.5 / 10,
                      child: TextField(
                        style: AppTextStyle.roboto12
                            .copyWith(color: AppColor.neutral13),
                        controller: _controller.searchController,
                        onChanged: (val) {
                          _controller.performSearch();
                        },
                        focusNode: _controller.searchFocusNode,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: AppColor.neutral1,
                          hintText: 'Search',
                          hintStyle: AppTextStyle.roboto12
                              .copyWith(color: AppColor.smokeGray),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColor.cinematicRed),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColor.cinematicRed),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColor.cinematicRed,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _controller.clearSearch,
                            icon: const Icon(
                              Icons.close,
                              color: AppColor.smokeGray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _controller.toggleSearch(context),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              secondChild: IconButton(
                onPressed: () => _controller.toggleSearch(context),
                icon: const Icon(Icons.search),
              ),
              crossFadeState: _controller.isSearching.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                milliseconds: 300,
              ),
            ),
          ],
        ),
        drawer: const Drawer(
          backgroundColor: AppColor.coolDarkBlue,
        ),
        body: RefreshIndicator(
          onRefresh: _controller.onRefresh,
          color: AppColor.cinematicRed,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstant.kDefaultSpacing * 2,
            ),
            controller: _controller.genreScrollController,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_controller.isSearching.value &&
                      _controller.isTyping.value) ...[
                    if (_controller.isLoading.value) ...[
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.cinematicRed,
                          ),
                        ),
                      ),
                    ] else ...[
                      SearchWidget(
                        movies: _controller.searchedMovies,
                        onMovieTap: (movie) =>
                            _controller.openMovieDetails(movie),
                      ),
                    ]
                  ] else ...[
                    PopularWidget(
                      onMovieTap: (movie) =>
                          _controller.openMovieDetails(movie),
                    ),
                    const SizedBox(
                      height: AppConstant.kDefaultSpacing * 4,
                    ),
                    LatestWidget(
                      onMovieTap: (movie) =>
                          _controller.openMovieDetails(movie),
                    ),
                    const SizedBox(
                      height: AppConstant.kDefaultSpacing * 4,
                    ),
                    GenreWidget(
                      onMovieTap: (movie) =>
                          _controller.openMovieDetails(movie),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
