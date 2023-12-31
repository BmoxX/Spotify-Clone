import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/pages/Search/cards_listing.dart';
import 'package:spotify/pages/Home/home_page.dart';
import 'package:spotify/pages/Library/library_page.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});
  static const int idx = 1;
  static const String id = '/searchPage';

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final routes = <Widget>[
    const homePage(),
    const searchPage(),
    const libraryPage()
  ];
  int selectedIndex = searchPage.idx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffold_BG_Color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: scaffold_BG_Color),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: !FocusScope.of(context).isFirstFocus
                        ? Colors.black
                        : scaffold_BG_Color,
                    size: 30,
                  ),
                  hintText: 'What do you want to listen to?',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Browse all',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              cards_listing(),
            ],
          ),
        ),
        //bottomNavigationBar: customBottomNavBar(),
      ),
    );
  }
}
