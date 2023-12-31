import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/pages/Home/widgets/trending_albums.dart';
import 'package:spotify/pages/Home/widgets/recent_played_albums.dart';
import 'package:spotify/pages/Search/search_page.dart';
import 'package:spotify/pages/Library/library_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static const int idx = 0;
  static const String id = '/homePage';

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffold_BG_Color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  Text(
                    'Good afternoon',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.alarm,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade900,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Music',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade900,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Podcasts & Shows',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              recentPlayedAlbums(),
              const SizedBox(height: 10),
              const Text(
                'Trending Albums for you',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const trendingAlbums(),
            ],
          ),
        ),
        //bottomNavigationBar: customBottomNavBar(),
      ),
    );
  }
}
