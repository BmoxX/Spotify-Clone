import 'package:flutter/material.dart';
import 'package:spotify/pages/Home/home_page.dart';
import 'package:spotify/pages/Search/search_page.dart';
import 'package:spotify/pages/Library/library_page.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/main.dart';

class CustomBottomNavBar extends StatefulWidget {
  final routes = <Widget>[
    homePage(),
    searchPage(),
    libraryPage(),
  ];
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black87, scaffold_BG_Color],
        ),
      ),
      child: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.white,
        unselectedItemColor: unselectedItemColor,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: ((index) {
          setState(() {
            selectedIndex = index;
            print(widget.routes[index].toString());
          });
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => widget.routes[index],
          ));
        }),
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search, color: Colors.white),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library_outlined),
              activeIcon: Icon(Icons.local_library_sharp),
              label: 'Your Library')
        ],
      ),
    );
  }
}
