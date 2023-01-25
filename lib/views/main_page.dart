import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_app/api.dart';
import 'package:movies_app/bloc/movie_bloc.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/controller/movie_controller.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/strings_manager.dart';
import 'package:movies_app/resources/styles_manager.dart';
import 'package:movies_app/resources/values_manager.dart';
import 'package:movies_app/widgets/active_carousel_card.dart';
import 'package:movies_app/widgets/animation_card.dart';
import 'package:movies_app/widgets/bottom_navigationBar.dart';
import 'package:movies_app/widgets/inactive_carousel_card.dart';
import 'package:movies_app/widgets/movie_heading.dart';
import 'package:movies_app/widgets/page_indicator.dart';
import 'package:movies_app/widgets/search_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  PageController? _controller;
  MovieController movieController = Get.put(MovieController());
  final imageBaseUrl = Api.imageBaseUrl;

  @override
  void initState() {
    _controller = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: kMainThemeColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppPadding.p20,
                    AppPadding.p28,
                    AppPadding.p20,
                    AppPadding.p8,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(ImageAssets.profilePicture),
                      ),
                      SizedBox(
                        width: AppSize.s12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextSpan(
                                  text: 'Arie',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            AppStrings.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(height: 1),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 25,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: kWidgetBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.s28),
                SearchBar(),
                SizedBox(height: AppSize.s40),
                MovieHeading(
                  heading1: 'Now',
                  heading2: 'Showing',
                ),
                SizedBox(height: AppSize.s12),
                Obx(
                  () => SizedBox(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _controller,
                      physics: ClampingScrollPhysics(),
                      itemCount: movieController.movieList.length < 3
                          ? movieController.movieList.length
                          : 3,
                      pageSnapping: true,
                      padEnds: false,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, i) {
                        final movie = movieController.movieList[i];
                        return currentIndex == i
                            ? ActiveCarouselCard(
                                imagePath: '$imageBaseUrl/${movie.posterPath}',
                              )
                            : InactiveCarouselCard(
                                imagePath: '$imageBaseUrl/${movie.posterPath}',
                              );
                      },
                    ),
                  ),
                ),
                PageIndicator(
                    length: movieController.movieList.length < 3
                        ? movieController.movieList.length
                        : 3,
                    currentIndex: currentIndex),
                MovieHeading(
                  heading1: 'Animation',
                  heading2: 'Film',
                ),
                SizedBox(height: AppSize.s20),
                AnimationCard(),
                SizedBox(height: AppSize.s28),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
