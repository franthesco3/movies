import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../components/text_item.dart';

abstract class DetailsViewModelProtocol extends ChangeNotifier {
  String get key;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'Nota: ${viewModel.vote}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
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
                Container(
                  height: 330,
                  width: double.infinity,
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: viewModel.key,
                    ),
                    showVideoProgressIndicator: true,
                  ),
                ),
                const SizedBox(height: 90),
              ],
            ),
          );
        },
      ),
      floatingActionButton: AnimatedBuilder(
        animation: viewModel,
        builder: (context, snapshot) {
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
