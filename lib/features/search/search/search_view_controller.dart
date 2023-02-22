import 'package:flutter/material.dart';
import 'package:movies/features/details/details_factory.dart';
import 'package:movies/features/search/search/search_view.dart';

import '../../../models/movie.dart';

abstract class SearchProtocol extends SearchViewModelProtocol {
  void Function(String query)? getQuery;
  void Function(Movie movie)? onTapGoToDetails;
}

class SearchViewController extends StatefulWidget {
  final SearchProtocol viewModel;

  const SearchViewController({super.key, required this.viewModel});

  @override
  State<SearchViewController> createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoToDetails = (movie) {
      Navigator.pushNamed(context, DetailsFactory.route, arguments: movie);
    };

    widget.viewModel.getQuery = (query) {
      widget.viewModel.searchMovies(query);
    };
  }
}
