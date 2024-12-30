import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokeflutter/src/views/favorites_pokemon/widgets/pokemon_widget.dart';
import 'package:pokeflutter/src/views/shared/widgets/button_back_widget.dart';

class FavoriteTeamPage extends StatefulWidget {
  static String routeName = 'favorite-team-page';
  const FavoriteTeamPage({super.key});

  @override
  State<FavoriteTeamPage> createState() => _FavoriteTeamPageState();
}

class _FavoriteTeamPageState extends State<FavoriteTeamPage> {
  List<dynamic> pokemonList = [];
  List<dynamic> typesList = [];
  dynamic pokemonSelected;
  double maxValue = 200;

  @override
  void initState() {
    listFavoritesPokemon();
    super.initState();
  }

  @override
  void dispose() {
    // controllerHome.dispose();
    super.dispose();
  }

  Future<void> listFavoritesPokemon() async {
    if (pokemonList.isEmpty) {
      pokemonList = [];
      setState(() {});

      // gengar gyarados dragonite charizard nidoking arcanine
      const listIdsPokemon = [6, 34, 59, 94, 130, 149];

      for (final id in listIdsPokemon) {
        final Response<String> getPokemon = await Dio().get(
          'https://pokeapi.co/api/v2/pokemon/$id',
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        pokemonList.add(jsonDecode(getPokemon.data!));
        setState(() {});
      }
    }
    setState(() {});
  }

  String capitalize(text) {
    return '${text![0].toUpperCase()}${text!.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 120,
        leading: const ButtonBackWidget(),
        title: const Text(
          'My Team',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            pokemonList.length != 6
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        // pokemonList
                        // .map((pokemon) =>
                        //     PokemonWidget(pokemon: pokemonList[0]))
                        // .toList(),
                        PokemonWidget(pokemon: pokemonList[0]),
                        const SizedBox(height: 10),
                        PokemonWidget(pokemon: pokemonList[1]),
                        const SizedBox(height: 10),
                        PokemonWidget(pokemon: pokemonList[2]),
                        const SizedBox(height: 10),
                        PokemonWidget(pokemon: pokemonList[3]),
                        const SizedBox(height: 10),
                        PokemonWidget(pokemon: pokemonList[4]),
                        const SizedBox(height: 10),
                        PokemonWidget(pokemon: pokemonList[5]),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
