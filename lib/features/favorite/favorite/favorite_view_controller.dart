import 'package:flutter/material.dart';

import 'package:movies/features/details/details_factory.dart';

import '../../../models/movie.dart';

import 'favorite_view.dart';

abstract class FavoriteProtocol extends FavoriteViewModelProtocol {
  void Function(Movie movie)? onTapGoToDetails;
}

class FavoriteViewController extends StatefulWidget {
  final FavoriteProtocol viewModel;

  const FavoriteViewController({super.key, required this.viewModel});

  @override
  State<FavoriteViewController> createState() => _FavoriteViewControllerState();
}

class _FavoriteViewControllerState extends State<FavoriteViewController> {
  @override
  void initState() {
    widget.viewModel.getMovie();
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoToDetails = (movie) {
      Navigator.pushNamed(context, DetailsFactory.route, arguments: movie);
    };
  }
}
