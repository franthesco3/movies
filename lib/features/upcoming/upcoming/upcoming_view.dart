import 'package:flutter/material.dart';
import '../../../support/components/card.dart';
import '../../../support/utils/localize.dart';

abstract class UpcomingViewModelProtocol extends ChangeNotifier {
  int get page;
  int get index;
  int get length;
  bool get isEmpty;
  bool get isLoading;

  void didTap(int index);
  String title(int index);
  void setIndex(int index);
  String imagePath(int index);
  void getUpcoming(int? page);
  void moreRequest(int page);
}

class UpcomingView extends StatelessWidget {
  final UpcomingViewModelProtocol viewModel;

  const UpcomingView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesDB - Upcoming'),
      ),
      backgroundColor: Colors.blueGrey,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.isEmpty) {
            return const Center(
              child: Text('Nâo foi possível carregar os dados'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => viewModel.moreRequest(viewModel.page + 1),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 4,
                      mainAxisExtent: MediaQuery.of(context).size.width / 3,
                      mainAxisSpacing: 8,
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
            ),
          );
        },
      ),
    );
  }
}
