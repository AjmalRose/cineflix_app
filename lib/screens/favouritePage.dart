import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/screens/movie_detail_screen.dart';
import 'package:cineflix_app/services/favouritePage_pref.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> favourites = [];

  @override
  void initState() {
    super.initState();
    _loadFavourites(); // load initially
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFavourites(); // reload for current user
  }

  Future<void> _loadFavourites() async {
    final username = await SharedPrefs.getUsername();
    if (username == null) return;

    final data = await FavouriteService.getFavourites(username);
    setState(() => favourites = data);
  }

  Future<void> _deleteMovie(String movieData) async {
    final username = await SharedPrefs.getUsername();
    if (username == null) return;

    await FavouriteService.removeFavourite(username, movieData);
    _loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      appBar: AppBar(
        backgroundColor: LoginColors.darkRed,
        title: Text(
          "My Favourites",
          style: TextStyle(color: ColorsConstants.ColorWhite),
        ),
        centerTitle: true,
      ),
      body: favourites.isEmpty
          ? Center(
              child: Text(
                "No favourites yet",
                style: TextStyle(color: ColorsConstants.ColorWhite),
              ),
            )
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final parts = favourites[index].split('|');
                final title = parts[0];
                final image = parts[1];
                final year = parts[2];
                final genre = parts[3];
                final duration = parts.length > 4 ? parts[4] : 'N/A';

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailScreen(
                          title: title,
                          image: image,
                          year: year,
                          genre: genre,
                          duration: duration,
                          rating: 0.0,
                          description: "No description available",
                        ),
                      ),
                    ).then((_) => _loadFavourites());
                  },
                  leading: Image.asset(image, width: 100, fit: BoxFit.cover),
                  title: Text(
                    title,
                    style: TextStyle(
                      color: ColorsConstants.ColorWhite,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    "$year • $genre",
                    style: TextStyle(color: LoginColors.colorgrey),
                  ),
                  trailing: IconButton(
                    icon: Image.asset(
                      AppImages.deleteIcon,
                      width: 60,
                      height: 60,
                    ),
                    onPressed: () => _deleteMovie(favourites[index]),
                  ),
                );
              },
            ),
    );
  }
}
