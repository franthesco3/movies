import '../components/text_item.dart';
import 'package:flutter/material.dart';
import '../components/vote_widget.dart';
import '../components/youtube_video_widget.dart';

abstract class DetailsViewModelProtocol extends ChangeNotifier {
  String? get key;
  String get vote;
  String get title;
  bool get isLoading;
  String get overview;
  bool get isFavorited;
  String get imagePath;

  void getVideo();
  void setFavorite();
}

class DetailsView extends StatelessWidget {
  final DetailsViewModelProtocol viewModel;

  const DetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('MoviesDB'),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(viewModel.imagePath),
                const SizedBox(height: 8),
                TextItem(
                  fontSize: 20,
                  bold: FontWeight.bold,
                  title: viewModel.title,
                ),
                TextItem(
                  fontSize: 18,
                  title: viewModel.overview,
                ),
                VoteAverage(vote: viewModel.vote),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Veja o treiler abaixo: ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                YoutuVideoWidget(videoKey: viewModel.key ?? ''),
                const SizedBox(height: 90),
              ],
            ),
          );
        },
      ),
      floatingActionButton: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return FloatingActionButton(
            onPressed: viewModel.setFavorite,
            child: Icon(Icons.favorite, color: colorFavoriteIcon),
          );
        },
      ),
    );
  }

  Color get colorFavoriteIcon {
    if (viewModel.isFavorited) return Colors.yellow;

    return Colors.white;
  }
}
