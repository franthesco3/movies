import 'package:hive/hive.dart';
import 'package:movies/models/movie.dart';

class MovieHiveAdapter extends TypeAdapter<Movie> {
  @override
  final typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    return Movie(
      id: reader.readInt(),
      title: reader.readString(),
      overview: reader.readString(),
      imagePath: reader.readString(),
      voteAverage: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.overview);
    writer.writeString(obj.imagePath);
    writer.writeDouble(obj.voteAverage);
  }
}
