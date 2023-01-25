import 'package:get/get.dart';
import 'package:movies_app/repository/repository.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movieList = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var movies = await Repository.getNowShowingMovies();
      if (movies != null) {
        Rx(movieList.value = movies);
        // movieList.assignAll(movies);
        // movies.forEach((item) {
        //   movieList.add(Movie.fromJson(item));
        // });
        print('Not Empty');
      } else {
        print('empty');
      }
    } finally {
      isLoading(false);
    }
  }
}
