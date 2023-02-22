import 'package:flutter/material.dart';

import '../../../support/components/card.dart';

abstract class SearchViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isLoading;

  void getSearchQuery();
  void didTap(int index);
  void onChange(String value);
  String imagePath(int index);
  void searchMovies(String query);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesDB - Search'),
      ),
      backgroundColor: Colors.blueGrey,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: viewModel.getSearchQuery,
                        child: const Icon(Icons.search, size: 32),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Pesquisar filme',
                    ),
                    onChanged: viewModel.onChange,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 200,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      return InkWell(
                        onTap: () => viewModel.didTap(index),
                        child: CardMovie(
                          path: viewModel.imagePath(index),
                        ),
                      );
                    },
                    childCount: viewModel.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
