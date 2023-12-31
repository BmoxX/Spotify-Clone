import 'package:flutter/material.dart';
import 'package:spotify/components/playlist_page.dart';
import 'package:spotify/components/playlists.dart';
import 'package:spotify/constants.dart';

class recentPlayedAlbums extends StatefulWidget {
  @override
  State<recentPlayedAlbums> createState() => _recentPlayedAlbumsState();
}

class _recentPlayedAlbumsState extends State<recentPlayedAlbums> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.7,
        ),
        itemBuilder: (context, index) {
          Playlist Album = Playlists.RecentPlayedPlaylists[index];

          return ReusableCard(
            playlist: Album,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return playlistPage(
                      playlist: Album,
                    );
                  }),
                );
              });
            },
          );
        },
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
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(playlist!.image.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  playlist!.title.toString(),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: homeCardsStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
