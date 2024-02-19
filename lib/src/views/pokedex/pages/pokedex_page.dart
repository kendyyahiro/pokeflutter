import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokeflutter/src/core/enums/pokemon_types_enum.dart';
import 'package:pokeflutter/src/views/pokedex/widgets/card_pokemon_widget.dart';
import 'package:pokeflutter/src/views/pokedex/widgets/modal_bottom_sheet_widget.dart';
import 'package:pokeflutter/src/views/shared/widgets/button_back_widget.dart';

class PokedexPage extends StatefulWidget {
  static String routeName = '/pokedex-page';

  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  // final HomeStore homeStore =
  //     MicroappHome.injector.get(); // Não lembro como funcionava ....
  // final TextEditingController controllerHome = TextEditingController();
  Map<PokemonFilterEnum, List> pokemonList = {};
  List<dynamic> typesList = [];
  dynamic pokemonSelected;
  PokemonFilterEnum typeSelected = PokemonFilterEnum.all;
  final Dio dio = Dio();
  bool isClosed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getAllPokemon());
  }

  @override
  void dispose() {
    // controllerHome.dispose();
    isClosed = true;
    super.dispose();
  }

  Future<void> getAllPokemon() async {
    try {
      if (pokemonList[PokemonFilterEnum.all]?.isNotEmpty ?? false) {
        return;
      }
      pokemonList[PokemonFilterEnum.all] = [];
      final queryParameters = {'limit': 500, 'offset': 0};

      const url = 'https://pokeapi.co/api/v2/pokemon/';
      final Response<String> response = await dio.get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        queryParameters: queryParameters,
      );

      final Map<String, dynamic> pokemonResults =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final result in pokemonResults['results'] as List<dynamic>) {
        if (isClosed) break;
        final Response<String> getPokemon = await dio.get(
          result['url'],
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (isClosed) break;
        pokemonList[PokemonFilterEnum.all]!.add(jsonDecode(getPokemon.data!));
        setState(() {});
      }
    } catch (_) {}
  }

  Future<void> searchByType(PokemonFilterEnum typeName) async {
    try {
      if (pokemonList[typeName] != null) {
        return;
      }
      pokemonList[typeName] = [];

      final url = 'https://pokeapi.co/api/v2/type/${typeName.name}';
      final Response<String> response = await dio.get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final Map<String, dynamic> pokemonResults =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final pokemon in pokemonResults['pokemon'] as List<dynamic>) {
        if (isClosed) break;
        final Response<String> getPokemon = await dio.get(
          pokemon['pokemon']['url'],
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (isClosed) break;
        pokemonList[typeName]!.add(jsonDecode(getPokemon.data!));
        setState(() {});
      }
    } catch (_) {}
  }

  String capitalize(text) {
    return '${text![0].toUpperCase()}${text!.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokédex',
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30), // here the desired height
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: PokemonFilterEnum.values.length,
                  itemBuilder: (_, index) {
                    final pokemonFilterEnum = PokemonFilterEnum.values[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: InkWell(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: pokemonFilterEnum.color,
                                blurRadius: 5,
                                offset: const Offset(1, 2),
                              ),
                            ],
                            color: pokemonFilterEnum.color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                capitalize(pokemonFilterEnum.name),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          typeSelected = pokemonFilterEnum;
                          searchByType(pokemonFilterEnum);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 12),
              const ButtonBackWidget(),
              const SizedBox(height: 12),
            ]),
          ),
          pokemonList.isEmpty
              ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()))
              : SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: pokemonList[typeSelected]!.length,
                  itemBuilder: (_, index) {
                    final svgUrl = pokemonList[typeSelected]![index]['sprites']
                            ['other']['dream_world']['front_default'] ??
                        '';
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalBottomSheetWidget(
                                image: svgUrl,
                                pokemon: pokemonList[typeSelected]![index]);
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(65, 131, 131, 131),
                              blurRadius: 30,
                              offset: Offset(1, 5),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CardPokemonWidget(
                                image: svgUrl,
                                pokemon: pokemonList[typeSelected]![index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
