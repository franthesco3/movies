import '../../../models/movie.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/details/details_factory.dart';
import 'package:movies/features/upcoming/upcoming/upcoming_view.dart';

abstract class UpcomingProtocol extends UpcomingViewModelProtocol {
  void Function()? onFailureGetUpcoming;
  void Function(Movie movie)? onTapGoToDetails;
}

class UpcomingViewController extends StatefulWidget {
  final UpcomingProtocol viewModel;

  const UpcomingViewController({super.key, required this.viewModel});

  @override
  State<UpcomingViewController> createState() => _UpcomingViewControllerState();
}

class _UpcomingViewControllerState extends State<UpcomingViewController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.getUpcoming(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UpcomingView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoToDetails = (movie) {
      Navigator.pushNamed(context, DetailsFactory.route, arguments: movie);
    };

    widget.viewModel.onFailureGetUpcoming = () {
      const snackBar = SnackBar(
        content: Text('Erro inesperado, tente novamente mais tarde!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };
  }
}
