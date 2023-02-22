import 'package:flutter/material.dart';
import 'package:movies/features/details/details/details_view.dart';

abstract class DetailsProtocol extends DetailsViewModelProtocol {
  void Function()? addMovie;
  void Function()? removeMovie;
}

class DetailsViewController extends StatefulWidget {
  final DetailsProtocol viewModel;

  const DetailsViewController({super.key, required this.viewModel});

  @override
  State<DetailsViewController> createState() => _DetailsViewControllerState();
}

class _DetailsViewControllerState extends State<DetailsViewController> {
  @override
  void initState() {
    widget.viewModel.getVideo();
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.removeMovie = () {
      const snackBar = SnackBar(
        content: Text('Filme removido!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };

    widget.viewModel.addMovie = () {
      const snackBar = SnackBar(
        content: Text('Filme adicionado!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };
  }
}
