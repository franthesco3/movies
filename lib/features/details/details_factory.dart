import 'package:flutter/material.dart';
import 'package:movies/api/routes/get_video.dart';
import 'package:movies/features/details/use_case/get_video_use_case.dart';

import '../../models/movie.dart';
import 'details/details_view_controller.dart';
import 'details/details_view_model.dart';

class DetailsFactory {
  static String route = '/details';

  static StatefulWidget details(Movie movie) {
    final routes = GetVideoRoutes();
    final useCase = GetVideoUseCase(routes: routes);
    final viewModel = DetailsViewModel(movie: movie, useCase: useCase);

    return DetailsViewController(viewModel: viewModel);
  }
}
