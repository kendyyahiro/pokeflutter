import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/src/features/core/constants/colors_type.dart';
import 'package:pokeflutter/src/features/core/enums/types_enum.dart';
import 'package:pokeflutter/src/features/domain/models/pokemon_model.dart';
import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  Map<String, List> pokemonList = {'all': []};
  List<dynamic> typesList = [];
  dynamic pokemonSelected;
  double maxValue = 200;
  String typeSelected = 'all';

  @override
  void initState() {
    showPokemons();
    showTypes();
    super.initState();
  }

  @override
  void dispose() {
    // controllerHome.dispose();
    super.dispose();
  }

  Future<void> showTypes() async {
    if (typesList.isEmpty) {
      const url = 'https://pokeapi.co/api/v2/type/';
      final Response<String> response = await Dio().get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final Map<String, dynamic> typesResults =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final type in typesResults['results'] as List<dynamic>) {
        typesList.add(type['name']);
        setState(() {});
      }
    }
  }

  Future<void> showPokemons() async {
    if (pokemonList['all']!.isNotEmpty) {
      return;
    }
    pokemonList['all'] = [];
    setState(() {});

    const url = 'https://pokeapi.co/api/v2/pokemon/';
    final Response<String> response = await Dio().get(
      url,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final Map<String, dynamic> pokemonResults =
        jsonDecode(response.data!) as Map<String, dynamic>;

    for (final result in pokemonResults['results'] as List<dynamic>) {
      final Response<String> getPokemon = await Dio().get(
        result['url'],
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      pokemonList['all']!.add(jsonDecode(getPokemon.data!));
      setState(() {});
    }
  }

  Future<void> searchByType(String typeName) async {
    if (pokemonList[typeName] != null) {
      return;
    }
    pokemonList[typeName] = [];
    setState(() {});

    final url = 'https://pokeapi.co/api/v2/type/$typeName';
    final Response<String> response = await Dio().get(
      url,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final Map<String, dynamic> pokemonResults =
        jsonDecode(response.data!) as Map<String, dynamic>;

    for (final pokemon in pokemonResults['pokemon'] as List<dynamic>) {
      final Response<String> getPokemon = await Dio().get(
        pokemon['pokemon']['url'],
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      pokemonList[typeName]!.add(jsonDecode(getPokemon.data!));
      setState(() {});
    }
  }

  String capitalize(text) {
    return '${text![0].toUpperCase()}${text!.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'PokéFlutter',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 16),
            typesList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 40,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: typesList.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 8),
                          child: InkWell(
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: ColorsType().getColor(
                                  typesList[index],
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    capitalize(typesList[index]),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              typeSelected = typesList[index];
                              searchByType(typesList[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
            pokemonList[typeSelected]!.isEmpty
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: pokemonList[typeSelected]!.length,
                      itemBuilder: (_, index) {
                        final svgUrl = pokemonList[typeSelected]![index]
                                ['sprites']['other']['dream_world']
                            ['front_default'];
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.8,
                                  child: Container(
                                    height: 1600,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: const Alignment(0.8, 1),
                                        colors: <Color>[
                                          ColorsType().getColor(
                                              pokemonList[typeSelected]![index]
                                                  ['types'][0]['type']['name']),
                                          ColorsType().getColor(
                                            pokemonList[typeSelected]![index]
                                                    ['types'][
                                                pokemonList[typeSelected]![
                                                                index]['types']
                                                            .length >
                                                        1
                                                    ? 1
                                                    : 0]['type']['name'],
                                          ),
                                        ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                        tileMode: TileMode.mirror,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 24),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const SizedBox(height: 20),
                                            if ((svgUrl ?? '') != '')
                                              SvgPicture.network(
                                                svgUrl,
                                                height: 200,
                                                width: 90,
                                                color: Colors.black,
                                                fit: BoxFit.contain,
                                              ),
                                            if ((svgUrl ?? '') == '')
                                              SvgPicture.asset(
                                                'assets/question-mark.svg',
                                                height: 200,
                                                width: 90,
                                                fit: BoxFit.contain,
                                              ),
                                            const SizedBox(height: 20),
                                            Text(
                                              capitalize(
                                                pokemonList[typeSelected]![
                                                    index]['name'],
                                              ),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 28,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: ColorsType().getColor(
                                                            pokemonList[typeSelected]![
                                                                        index]
                                                                    ['types'][0]
                                                                [
                                                                'type']['name']),
                                                        blurRadius: 8,
                                                        offset: const Offset(
                                                            0.5, 2),
                                                      ),
                                                    ],
                                                    color: ColorsType()
                                                        .getColor(pokemonList[
                                                                    typeSelected]![
                                                                index]['types'][
                                                            0]['type']['name']),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/${pokemonList[typeSelected]![index]['types'][0]['type']['name']}.svg',
                                                  ),
                                                ),
                                                if ((pokemonList[typeSelected]![
                                                            index]['types'])
                                                        .length >
                                                    1)
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: ColorsType().getColor(
                                                              pokemonList[typeSelected]![
                                                                          index]
                                                                      [
                                                                      'types'][1]
                                                                  [
                                                                  'type']['name']),
                                                          blurRadius: 8,
                                                          offset: const Offset(
                                                              0.5, 2),
                                                        ),
                                                      ],
                                                      color: ColorsType().getColor(
                                                          pokemonList[typeSelected]![
                                                                      index]
                                                                  ['types'][1]
                                                              ['type']['name']),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/icons/${pokemonList[typeSelected]![index]['types'][1]['type']['name']}.svg',
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'HP',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 9.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][0]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'Attack',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 8.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][1]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'Defense',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 8.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][2]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'Sp. Attack',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 8.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][3]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'Sp. Defense',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 8.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][4]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'Speed',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    width: maxValue,
                                                    lineHeight: 8.0,
                                                    percent:
                                                        pokemonList[typeSelected]![
                                                                        index]
                                                                    ['stats'][5]
                                                                ['base_stat'] /
                                                            maxValue *
                                                            0.75,
                                                    animation: true,
                                                    progressColor: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromARGB(65, 131, 131, 131),
                                  blurRadius: 15,
                                  offset: Offset(1, 0.5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '#${pokemonList[typeSelected]![index]['id']}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if ((svgUrl ?? '') != '')
                                          SvgPicture.network(
                                            svgUrl.toString(),
                                            height: 75,
                                            width: 75,
                                            fit: BoxFit.contain,
                                          ),
                                        if ((svgUrl ?? '') == '')
                                          SvgPicture.asset(
                                            'assets/question-mark.svg',
                                            height: 75,
                                            width: 90,
                                            fit: BoxFit.contain,
                                          ),
                                        const SizedBox(height: 8),
                                        Text(
                                          capitalize(
                                              pokemonList[typeSelected]![index]
                                                  ['name']),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    color: ColorsType()
                                                        .getColor(pokemonList[
                                                                    typeSelected]![
                                                                index]['types'][
                                                            0]['type']['name']),
                                                    blurRadius: 8,
                                                    offset:
                                                        const Offset(0.5, 2),
                                                  ),
                                                ],
                                                color: ColorsType().getColor(
                                                    pokemonList[typeSelected]![
                                                            index]['types'][0]
                                                        ['type']['name']),
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/${pokemonList[typeSelected]![index]['types'][0]['type']['name']}.svg',
                                              ),
                                            ),
                                            if ((pokemonList[typeSelected]![
                                                        index]['types'])
                                                    .length >
                                                1)
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  boxShadow: <BoxShadow>[
                                                    BoxShadow(
                                                      color: ColorsType().getColor(
                                                          pokemonList[typeSelected]![
                                                                      index]
                                                                  ['types'][1]
                                                              ['type']['name']),
                                                      blurRadius: 8,
                                                      offset:
                                                          const Offset(0.5, 2),
                                                    ),
                                                  ],
                                                  color: ColorsType().getColor(
                                                      pokemonList[typeSelected]![
                                                              index]['types'][1]
                                                          ['type']['name']),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/icons/${pokemonList[typeSelected]![index]['types'][1]['type']['name']}.svg',
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
