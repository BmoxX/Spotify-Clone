import 'package:flutter/material.dart';
import 'song.dart';
import 'playlist_page.dart';
import 'package:audioplayers/audioplayers.dart';

class CurrentSong extends ChangeNotifier {
  Song selected = Song(
    owner: 'owner',
    name: 'name',
    image: 'image',
    audio: 'audio',
  );

  void playSong() async {
    selected.isPlaying = true;
    await audioPlayer.play(AssetSource(selected.audio.toString()));
    notifyListeners();
  }

  void stopSong() async {
    selected.isPlaying = false;
    await audioPlayer.pause();
    notifyListeners();
  }

  void selectedSong(Song song) {
    selected = song;
    notifyListeners();
  }
}
