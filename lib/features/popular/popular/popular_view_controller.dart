import 'popular_view.dart';
import '../../../models/movie.dart';
import 'package:flutter/material.dart';
import '../../details/details_factory.dart';

abstract class PopularProtocol extends PopularViewModelProtocol {
  void Function(Movie movie)? onTapGoToDetails;
}

class PopularViewController extends StatefulWidget {
  final PopularProtocol viewModel;

  const PopularViewController({super.key, required this.viewModel});

  @override
  State<PopularViewController> createState() => _PopularViewControllerState();
}

class _PopularViewControllerState extends State<PopularViewController> {
  @override
  void initState() {
    widget.viewModel.getPopular();
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopularView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoToDetails = (movie) {
      Navigator.pushNamed(context, DetailsFactory.route, arguments: movie);
    };
  }
}
