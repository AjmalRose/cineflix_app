import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/screens/movie_detail_screen.dart';
import 'package:cineflix_app/services/favouritePage_pref.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> favourites = [];

  @override
  void initState() {
    super.initState();
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    final username = await SharedPrefs.getUsername();
    if (username == null) return;
    final data = await FavouriteService.getFavourites(username);
    setState(() => favourites = data);
  }

  Future<void> deleteMovie(String movieData) async {
    final username = await SharedPrefs.getUsername();
    if (username == null) return;
    await FavouriteService.removeFavourite(username, movieData);
    loadFavourites();
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
                    ).then(
                      (_) => loadFavourites(),
                    ); //  refresh after coming back
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
                    onPressed: () => deleteMovie(favourites[index]),
                  ),
                );
              },
            ),
    );
  }
}
