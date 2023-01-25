import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/repository/repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitialState()) {
    on<MovieEvent>((event, emit) async {
      if (event is LoadDataEvent) {
        emit(MovieLoadingState());
        var moviesList = await Repository.getAnimationMovies();
        if (moviesList == null) {
          print('Animation empty');
          emit(MovieErrorState());
        } else {
          print('Animation Success');
          emit(MovieLoadedStated(movies: moviesList));
        }
      }
    });
  }
}
