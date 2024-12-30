import 'package:flutter/material.dart';
import 'package:pokeflutter/src/views/bag/pages/bag_page.dart';
import 'package:pokeflutter/src/views/favorites_pokemon/pages/favorite_team_page.dart';
import 'package:pokeflutter/src/views/home/widgets/option_widget.dart';
import 'package:pokeflutter/src/views/pokedex/pages/pokedex_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String optionSelected = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String changeOptionSelected(String option) {
    optionSelected = option;
    isLoading = true;
    setState(() {});
    return optionSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 60,
                  width: 60,
                ),
                const Text(
                  'PokéFlutter',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 24),
                OptionWidget(
                    route: PokedexPage.routeName,
                    title: 'Pokédex',
                    func: changeOptionSelected,
                    optionSelected: optionSelected,
                    isLoading: isLoading),
                const SizedBox(height: 16),
                OptionWidget(
                    route: FavoriteTeamPage.routeName,
                    title: 'Pokémon',
                    func: changeOptionSelected,
                    optionSelected: optionSelected,
                    isLoading: isLoading),
                const SizedBox(height: 16),
                OptionWidget(
                    route: BagPage.routeName,
                    title: 'Bag',
                    func: changeOptionSelected,
                    optionSelected: optionSelected,
                    isLoading: isLoading),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Made by',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(width: 10),
              Text(
                'Kendy',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8)
        ],
      )),
    );
  }
}
