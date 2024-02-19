import 'package:flutter/material.dart';
import 'package:pokeflutter/src/views/home/pages/home_page.dart';
import 'package:pokeflutter/src/views/bag/pages/bag_page.dart';
import 'package:pokeflutter/src/views/favorites_pokemon/pages/favorite_team_page.dart';
import 'package:pokeflutter/src/views/pokedex/pages/pokedex_page.dart';

class AppRoutes {
  Map<String, WidgetBuilder> get publicRoutes => <String, WidgetBuilder>{
        HomePage.routeName: (BuildContext context) => const HomePage(),
        PokedexPage.routeName: (BuildContext context) => const PokedexPage(),
        FavoriteTeamPage.routeName: (BuildContext context) =>
            const FavoriteTeamPage(),
        BagPage.routeName: (BuildContext context) => const BagPage(),
      };

  String get initialRoute => HomePage.routeName;
}
