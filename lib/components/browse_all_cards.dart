import 'package:flutter/material.dart';

class browseCard {
  browseCard({this.type, this.colour, this.image});
  String? type = 'Podcasts';
  Color? colour = Colors.orange;
  String? image = '/images';
}

List<browseCard> cards = [
  browseCard(
      type: 'Podcasts',
      colour: Colors.deepOrange,
      image: 'images/podcasts.jpg'),
  browseCard(
      type: 'K-pop', colour: Colors.deepPurpleAccent, image: 'images/kpop.jpg'),
  browseCard(
      type: 'Made For You',
      colour: Colors.blue,
      image: 'images/jamesArthur.jpg'),
  browseCard(
      type: 'New Releases', colour: Colors.pink, image: 'images/brunoMars.jpg'),
  browseCard(
      type: 'Ramadan', colour: Colors.yellow, image: 'images/ramadan.jpg'),
  browseCard(type: 'Arab', colour: Colors.blueAccent, image: 'images/arab.jpg'),
  browseCard(type: 'Pop', colour: Colors.green, image: 'images/rodrigo.jpg'),
  browseCard(
      type: 'Hip-Hop', colour: Colors.orange, image: 'images/hiphop.jpg'),
];
