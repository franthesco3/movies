import 'package:flutter/material.dart';
import 'package:movies/features/favorite/favorite/favorite_view_controller.dart';
import 'package:movies/features/favorite/favorite/favorite_view_model.dart';

class FavoriteFactory {
  static String route = '/favorite';

  static StatefulWidget favorite() {
    final viewModel = FavoriteViewModel();

    return FavoriteViewController(viewModel: viewModel);
  }
}
