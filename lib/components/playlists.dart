import 'package:flutter/material.dart';
import 'song.dart';

class Playlist {
  Playlist({
    this.title,
    this.owner,
    this.image,
    this.isDownloaded,
    this.color,
    this.songs,
    this.isAlbum,
  });
  bool? isAlbum = false;
  String? title = 'Podcasts';
  String? owner = 'James Arthur';
  String? image = '/images';
  bool? isDownloaded = false;
  Color? color = Colors.red;
  String? description = 'BluhBluhBluhBluh';
  List<Song>? songs = [
    Song(
      owner: 'The Weeknd',
      name: 'less than zero',
      image: 'images/DawnFM.jpg',
      audio: 'DawnFM/Less_Than_Zero_live.mp3',
    )
  ];
  List<Song>? getSongs() {
    return songs;
  }
}

class Playlists {
  static List<Playlist> RecentPlayedPlaylists = [
    Playlist(
      title: 'Complete Juice WRLD',
      owner: 'Juice WRLD',
      image: 'images/juiceWrld.jpg',
      isDownloaded: true,
      color: Colors.red,
    ),
    Playlist(
      title: 'Liked Songs',
      owner: 'Me',
      image: 'images/likedSongs.jpg',
      isDownloaded: true,
      color: Colors.blueAccent,
    ),
    Playlist(
      title: 'throwback',
      owner: 'Abdul rahman',
      image: 'images/throwback.jpg',
      color: Colors.brown.shade600,
    ),
    Playlist(
      title: 'Acoustic James Arthur',
      owner: 'James Arthur',
      image: 'images/acousticJamesArthur.jpg',
      color: Colors.deepOrange,
    ),
    Playlist(
      title: 'Complete James Arthur',
      owner: 'James Arthur',
      image: 'images/completeJamesArthur.jpg',
      color: Colors.lightBlueAccent,
    ),
    Playlist(
      title: 'Arabic',
      owner: 'IDK',
      image: 'images/arabic.jpg',
      color: Colors.teal,
    ),
  ];
  static List<Playlist> TrendingAlbums = [
    Playlist(
      isAlbum: true,
      title: 'Dawn FM',
      image: 'images/DawnFM.jpg',
      owner: 'The Weeknd',
      color: Colors.blue,
      songs: [
        Song(
          owner: 'The Weeknd',
          name: 'less than zero',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Less_Than_Zero_live.mp3',
          color: Colors.blueAccent,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Dawn FM',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Dawn_FM_live.mp3',
          color: Colors.blueAccent,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Take My Breath',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Take_My_Breath_live.mp3',
          color: Colors.blueAccent,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Starry Eyes',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Starry_Eyes_live.mp3',
          color: Colors.blueAccent,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Gasolina',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Gasoline_live.mp3',
          color: Colors.blueAccent,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Is There Someone Else',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Is_There_Someone_Else_live.mp3',
          color: Colors.blueAccent,
        ),
      ],
    ),
    Playlist(
      title: 'After Hours',
      owner: 'The Weeknd',
      image: 'images/The_Weeknd_After_Hours.png',
      color: Colors.brown,
      songs: [
        Song(
          owner: 'The Weeknd',
          name: 'less than zero',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Less_Than_Zero_live.mp3',
          color: Colors.brown,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Dawn FM',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Dawn_FM_live.mp3',
          color: Colors.brown,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Take My Breath',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Take_My_Breath_live.mp3',
          color: Colors.brown,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'Starry Eyes',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Starry_Eyes_live.mp3',
          color: Colors.brown,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'less than zero',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Less_Than_Zero_live.mp3',
          color: Colors.brown,
        ),
        Song(
          owner: 'The Weeknd',
          name: 'less than zero',
          image: 'images/DawnFM.jpg',
          audio: 'DawnFM/Less_Than_Zero_live.mp3',
          color: Colors.brown,
        ),
      ],
    ),
    Playlist(
      title: 'Starboy',
      owner: 'The Weeknd',
      image: 'images/The_Weeknd_Starboy.png',
      color: Colors.red,
    ),
    Playlist(
      title: 'Beauty behind \nthe madness',
      owner: 'The Weeknd',
      image: 'images/The_Weeknd_Beauty_Behind_the_Madness.png',
      color: Colors.grey,
    ),
    Playlist(
      title: 'Back from \n the edge',
      owner: 'The Weeknd',
      image: 'images/James_Arthur_Back_from_the_Edge.jpg',
      color: Colors.lightBlue.shade300,
    ),
    Playlist(
      title: 'it will make sense',
      owner: 'The Weeknd',
      image: 'images/itWillMakeSense.jpg',
      color: Colors.deepOrangeAccent,
    ),
  ];

  var playlistTypes = [RecentPlayedPlaylists, TrendingAlbums];
}
