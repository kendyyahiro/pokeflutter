import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/presentation/pages/team/favorite_team_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/home/widgets/option_widget.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionWidget(route: PokedexPage.routeName, title: 'Pokédex'),
            const SizedBox(height: 16),
            OptionWidget(route: FavoriteTeamPage.routeName, title: 'Pokémon'),
            const SizedBox(height: 16),
            OptionWidget(route: FavoriteTeamPage.routeName, title: 'Bag'),
            const SizedBox(height: 16),
          ],
        ),
      )),
    );
  }
}
