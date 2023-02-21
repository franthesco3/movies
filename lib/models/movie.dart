class Movie {
  final int id;
  bool isFavorite = false;
  final String title;
  final String overview;
  final String imagePath;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.imagePath,
    required this.voteAverage,
  });

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        isFavorite = false,
        title = map['title'],
        overview = map['overview'],
        imagePath = map['poster_path'],
        voteAverage = map['vote_average'].toDouble();
}
