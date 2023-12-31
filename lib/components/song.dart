import 'package:flutter/material.dart';

class Song {
  String? name;
  String? owner;
  String? image;
  String? audio;
  bool? isPlaying = false;
  Color? color;

  Song({this.name, this.owner, this.image, this.audio, this.color});
}
