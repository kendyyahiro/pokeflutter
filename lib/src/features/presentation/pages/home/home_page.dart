import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/presentation/pages/bag/bag_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/team/favorite_team_page.dart';
import 'package:pokeflutter/src/features/presentation/pages/home/widgets/option_widget.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex/pokedex_page.dart';

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
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      )),
    );
  }
}
