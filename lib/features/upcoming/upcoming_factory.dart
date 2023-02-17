import 'package:flutter/material.dart';
import 'package:movies/api/routes/upcoming_routes.dart';
import 'package:movies/features/upcoming/upcoming/upcoming_view_controller.dart';
import 'package:movies/features/upcoming/upcoming/upcoming_view_model.dart';
import 'package:movies/features/upcoming/use_case/upcoming_use_case.dart';

class UpcomingFactory {
  static String route = '/home';

  static StatefulWidget home() {
    final routes = UpcomingRoutes();
    final useCase = UpcomingUseCase(routes: routes);
    final viewModel = UpcomingViewModel(useCase: useCase);

    return UpcomingViewController(
      viewModel: viewModel,
      key: GlobalObjectKey(viewModel),
    );
  }
}
