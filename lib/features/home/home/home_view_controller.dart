import 'package:flutter/material.dart';
import 'package:movies/features/home/home/home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {}

class HomeViewController extends StatefulWidget {
  final HomeProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }
}
