import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/components/current_song.dart';
import 'constants.dart';
import 'package:spotify/pages/Home/home_page.dart';
import 'pages/Search/search_page.dart';
import 'pages/Library/library_page.dart';
import 'components/custom_bottom_nav_bar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  void addOverlay(BuildContext context) {
    print(Overlay.of(context));

    return Overlay.of(context).insert(OverlayEntry(
      builder: (context) {
        return CustomBottomNavBar();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentSong()),
        //ChangeNotifierProvider(create: (context) => SomeOtherClass()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Spotify',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: scaffold_BG_Color,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) {
                  return child!; // Your main content
                },
              ),
              OverlayEntry(
                builder: (context) {
                  return const Positioned(
                    bottom:
                        70, // Adjust this value to change the distance from the bottom
                    left: 0,
                    right: 0,
                    child: PlayingSongCard(),
                  );
                },
              ),
              OverlayEntry(
                builder: (context) {
                  return Positioned(
                    bottom:
                        0, // Adjust this value to change the distance from the bottom
                    left: 0,
                    right: 0,
                    child: CustomBottomNavBar(),
                  );
                },
              ),
            ],
          );
        },
        initialRoute: homePage.id,
        routes: {
          homePage.id: (context) => const homePage(),
          searchPage.id: (context) => const searchPage(),
          libraryPage.id: (context) => const libraryPage(),
        },
      ),
    );
  }
}

class PlayingSongCard extends StatefulWidget {
  const PlayingSongCard({super.key});

  @override
  State<PlayingSongCard> createState() => _PlayingSongCardState();
}

class _PlayingSongCardState extends State<PlayingSongCard> {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSong>().selected;
    final color = selected.owner.toString() == 'owner'
        ? Colors.grey.shade700
        : selected.color;
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black, //New
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: selected.image.toString() == 'image'
                    ? const AssetImage('images/BlackBackground.jpg')
                    : AssetImage(selected.image.toString()),
                fit: BoxFit.cover,
                width: 50,
                height: 75,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Text(selected.name.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                    )),
              ),
              Material(
                color: Colors.transparent,
                child: Text(selected.owner.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'OpenSans',
                    )),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.devices_sharp,
            color: Colors.white54,
          ),
          const SizedBox(width: 10),
          //const Icon(Icons.play_arrow, size: 30),
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (selected.isPlaying == true) {
                    context.read<CurrentSong>().stopSong();
                  } else {
                    context.read<CurrentSong>().playSong();
                  }
                });
              },
              icon: Icon(
                  selected.isPlaying == true ? Icons.pause : Icons.play_arrow,
                  size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
