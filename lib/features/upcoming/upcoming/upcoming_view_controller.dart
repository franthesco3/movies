import 'package:flutter/material.dart';
import 'package:movies/features/upcoming/upcoming/upcoming_view.dart';

abstract class UpcomingProtocol extends UpcomingViewModelProtocol {
  void getUpcoming();
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
    widget.viewModel.getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UpcomingView(viewModel: widget.viewModel);
  }

  void _bind() {}
}
