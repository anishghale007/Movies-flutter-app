part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedStated extends MovieState {
  final movies;
  MovieLoadedStated({required this.movies});
}

class MovieErrorState extends MovieState {}
