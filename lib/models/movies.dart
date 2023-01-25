class Movie {
  late int id;
  late String title;
  late String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  // Movie.initState()
  //     : id = 0,
  //       title = 'not available';

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }
}
