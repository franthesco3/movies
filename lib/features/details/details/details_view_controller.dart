import 'package:flutter/material.dart';
import 'package:movies/features/details/details/details_view.dart';
import 'package:movies/support/utils/hive_configs.dart';

abstract class DetailsProtocol extends DetailsViewModelProtocol {}

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

  void _bind() {}
}
