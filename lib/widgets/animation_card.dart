import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api.dart';
import 'package:movies_app/bloc/movie_bloc.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/resources/strings_manager.dart';
import 'package:movies_app/resources/styles_manager.dart';
import 'package:movies_app/resources/values_manager.dart';

class AnimationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageBaseUrl = Api.imageBaseUrl;

    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieInitialState) {
          context.read<MovieBloc>().add(LoadDataEvent());
        } else if (state is MovieLoadedStated) {
          List<Movie> movies = state.movies;
          return Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: movies.length < 7 ? movies.length : 7,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                    child: Container(
                      height: 200,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWidgetBackgroundColor,
                        image: DecorationImage(
                          image:
                              NetworkImage('$imageBaseUrl/${movie.posterPath}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is MovieLoadingState) {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          );
        } else if (state is MovieErrorState) {
          return Center(
            child: Text(
              AppStrings.error,
              style: getRegularStyle(color: Colors.white),
            ),
          );
        }
        return Container();
      },
    );
  }
}
