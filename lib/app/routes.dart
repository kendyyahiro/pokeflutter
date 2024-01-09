import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/presentation/pages/bag/bag_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/team/favorite_team_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/home/home_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex/pokedex_page.dart';

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
