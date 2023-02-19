class Movie {
  final int id;
  bool isFavorite;
  final bool video;
  final String title;
  final String overview;
  final String imagePath;
  final double voteAverage;

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        isFavorite = false,
        title = map['title'],
        video = map['video'],
        overview = map['overview'],
        imagePath = map['poster_path'],
        voteAverage = map['vote_average'].toDouble();
}
