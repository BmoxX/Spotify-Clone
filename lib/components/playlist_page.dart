import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/components/current_song.dart';
import 'package:spotify/components/playlists.dart';
import 'package:spotify/components/song.dart';
import 'package:spotify/constants.dart';
import 'package:provider/provider.dart';
import 'song_card.dart';

AudioPlayer audioPlayer = AudioPlayer();

class playlistPage extends StatelessWidget {
  playlistPage({this.playlist});
  static const String id = '/playlistPage';
  final Playlist? playlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [playlist?.color ?? Colors.white, scaffold_BG_Color],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextField(
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: scaffold_BG_Color),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: !FocusScope.of(context).isFirstFocus
                                    ? Colors.grey
                                    : Colors.white,
                                size: 27,
                              ),
                              hintText: 'Find in playlist',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.5),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        SizedBox(
                          height: 40,
                          width: 80,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(7)),
                            child: const Center(
                              child: Text(
                                'Sort',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 250,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black, //New
                              blurRadius: 30.0,
                            )
                          ],
                        ),
                        child: Image(
                          image: AssetImage(playlist!.image.toString()),
                          width: 250,
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      playlist!.title.toString(),
                      style: playlistPageTextStyle,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      playlist!.description.toString(),
                      style: playlistPageDescriptionTextStyle,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: const Color(0xFF00CC99),
                          child: Text(
                            playlist!.owner.toString()[0],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Text(
                          playlist!.owner.toString(),
                          style: playlistPageOwnerTextStyle,
                        ),
                        const SizedBox(width: 5),
                        const Row(),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: <Widget>[
                        Icon(
                          Icons.check_circle,
                          color: Color(0xFF3BB143),
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.download_for_offline,
                          color: Color(0xFF3BB143),
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Spacer(),
                        SizedBox(width: 20),
                        Icon(
                          Icons.shuffle_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(width: 25),
                        Icon(
                          Icons.play_circle_fill,
                          color: Color(0xFF3BB143),
                          size: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Playlist_SongsList(playlist: playlist),
          ],
        ),
      ),
    );
  }
}

class Playlist_SongsList extends StatelessWidget {
  const Playlist_SongsList({
    super.key,
    required this.playlist,
  });

  final Playlist? playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: playlist!.songs!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 6.5,
        ),
        itemBuilder: (context, index) {
          if (playlist?.songs?.length != 0) {
            Song song = playlist!.songs![index];
            final selected =
                context.watch<CurrentSong>().selected.name == song.name;
            final textStyle = selected
                ? TextStyle(
                    fontSize: 17,
                    color: Colors.green.shade600,
                  )
                : const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  );
            return SongCard(
              song: song,
              isAlbum: playlist!.isAlbum,
              textStyle: textStyle,
            );
          } else {
            return const SizedBox(width: 100, height: 20);
          }
        },
      ),
    );
  }
}
