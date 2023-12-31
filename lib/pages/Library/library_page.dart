import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/components/playlists.dart';
import 'package:spotify/components/playlist_page.dart';
import 'package:spotify/pages/Home/home_page.dart';
import 'package:spotify/pages/Search/search_page.dart';

class libraryPage extends StatefulWidget {
  const libraryPage({super.key});
  static const int idx = 2;
  static const String id = '/libraryPage';

  @override
  State<libraryPage> createState() => _libraryPageState();
}

class _libraryPageState extends State<libraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: scaffold_BG_Color,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 15),
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        Text(
                          'Your library',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search_outlined,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.add,
                          size: 35,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade900,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Playlists',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade900,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Artists',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade900,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Downloaded',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward_outlined,
                            size: 17,
                          ),
                          Icon(
                            Icons.arrow_downward_outlined,
                            size: 17,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Recents',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.list_outlined,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: Playlists.RecentPlayedPlaylists.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.77,
                        ),
                        itemBuilder: (context, index) {
                          Playlist playlist =
                              Playlists.RecentPlayedPlaylists[index];

                          return ReusableCard(
                            playlist: playlist,
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return playlistPage(
                                      playlist: playlist,
                                    );
                                  }),
                                );
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //bottomNavigationBar: customBottomNavBar(),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, this.playlist, this.onPressed});
  final Playlist? playlist;
  final Function()? onPressed;
  Widget isPlaylistDownloaded(Playlist playlist) {
    if (playlist.isDownloaded == true) {
      return const Icon(
        Icons.download_for_offline,
        color: Colors.green,
        size: 17,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(playlist!.image.toString()),
              height: 180,
            ),
            const SizedBox(
              height: 15,
            ),
            FittedBox(
              child: Text(
                playlist!.title.toString(),
                textAlign: TextAlign.left,
                style: libraryPlaylistTextStyle,
                softWrap: false,
                overflow: TextOverflow.clip,
              ),
            ),
            Row(
              children: <Widget>[
                isPlaylistDownloaded(playlist!),
                Text(
                  'Playlist . ${playlist!.owner.toString()}',
                  style: libraryPlaylistOwnerTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
