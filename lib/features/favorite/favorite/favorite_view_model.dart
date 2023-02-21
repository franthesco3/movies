import 'package:hive/hive.dart';
import 'package:movies/support/utils/constants.dart';
import 'package:movies/support/utils/hive_configs.dart';

import '../../../models/movie.dart';
import 'favorite_view_controller.dart';

class FavoriteViewModel extends FavoriteProtocol {
  late Box _box;
  bool _isLoading = false;
  late List<Movie> _movies = [];

  @override
  String get title => '';

  @override
  bool get isLoading => _isLoading;

  @override
  int get length => _movies.length;

  @override
  bool get isEmpty => _movies.isEmpty;

  @override
  String imagePath(int index) {
    return Constants.urlImagePath + _movies[index].imagePath;
  }

  @override
  Future<void> getMovie() async {
    _setLoading(true);
    HiveConfigs.start();
    _box = await Hive.openBox<Movie>('movies');
    final list = _box.values.cast<Movie>();
    _movies.addAll(list);

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}