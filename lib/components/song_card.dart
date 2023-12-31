import 'package:flutter/material.dart';
import 'song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'current_song.dart';
import 'package:provider/provider.dart';
import 'playlist_page.dart';

class SongCard extends StatefulWidget {
  SongCard({this.song, this.isAlbum, this.textStyle});
  final Song? song;
  final TextStyle? textStyle;
  final bool? isAlbum;

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  Widget Is_Album() {
    if (widget.isAlbum == false) {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.song!.image.toString()),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSong>().selected;
    return GestureDetector(
      onTap: () async {
        context.read<CurrentSong>().selectedSong(widget.song!);
        if (widget.song!.isPlaying == false) {
          await audioPlayer.play(AssetSource(widget.song!.audio.toString()));
          setState(() {
            widget.song!.isPlaying = true;
            context.read<CurrentSong>().playSong();
          });
        } else {
          await audioPlayer.pause();
          setState(() {
            widget.song!.isPlaying = false;
            context.read<CurrentSong>().stopSong();
          });
        }
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Is_Album(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widget.song!.isPlaying == true && selected == widget.song
                        ? const Icon(
                            Icons.play_arrow,
                            color: Colors.green,
                            size: 20,
                          )
                        : const SizedBox.shrink(),
                    widget.song!.isPlaying == true && selected == widget.song
                        ? const SizedBox(width: 5)
                        : const SizedBox.shrink(),
                    Text(
                      widget.song!.name.toString(),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: widget.song!.isPlaying == true &&
                              selected == widget.song
                          ? widget.textStyle
                          : const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  widget.song!.owner.toString(),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Column(
              children: [
                SizedBox(height: 5),
                Icon(Icons.more_horiz_outlined, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
