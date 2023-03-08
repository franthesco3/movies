import 'package:flutter/material.dart';
import 'package:movies/api/routes/search_routes.dart';
import 'package:movies/features/search/search/search_view_model.dart';
import 'package:movies/features/search/use_case/search_use_case.dart';
import 'package:movies/features/search/search/search_view_controller.dart';

class SearchFactory {
  static String route = '/search';

  static StatefulWidget search() {
    final routes = SearchRoutes();
    final useCase = SearchUseCase(routes: routes);
    final viewModel = SearchViewModel(useCase: useCase);

    return SearchViewController(viewModel: viewModel);
  }
}
