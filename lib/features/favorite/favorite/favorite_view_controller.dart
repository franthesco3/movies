import 'package:flutter/material.dart';

import 'favorite_view.dart';

abstract class FavoriteProtocol extends FavoriteViewModelProtocol {}

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteView(viewModel: widget.viewModel);
  }
}
