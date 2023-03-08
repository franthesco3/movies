import 'package:flutter/material.dart';
import 'popular/popular_view_model.dart';
import '../../api/routes/popular_routes.dart';
import 'package:movies/features/popular/use_case/popular_use_case.dart';
import 'package:movies/features/popular/popular/popular_view_controller.dart';

class PopularFactory {
  static String route = '/popular';

  static StatefulWidget popular() {
    final routes = PopularRoutes();
    final useCase = PopularUseCase(routes: routes);
    final viewModel = PopularViewModel(useCase: useCase);

    return PopularViewController(viewModel: viewModel);
  }
}
