import 'package:flutter/material.dart';
import 'package:spotify/components/playlist_page.dart';
import 'package:spotify/components/playlists.dart';
import 'package:spotify/constants.dart';

class trendingAlbums extends StatefulWidget {
  const trendingAlbums({super.key});

  @override
  State<trendingAlbums> createState() => _trendingAlbumsState();
}

class _trendingAlbumsState extends State<trendingAlbums> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Playlist playlist = Playlists.TrendingAlbums[index];

            return ReusableCard(
              playlist: playlist,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              playlistPage(playlist: playlist)));
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.playlist, this.onPressed});
  final Playlist? playlist;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 170,
        height: 170,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(playlist!.image.toString()),
              width: 140,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              playlist!.title.toString(),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: homeTrendingAlbumsStyle,
            ),
          ],
        ),
      ),
    );
  }
}
