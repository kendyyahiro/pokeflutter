import 'dart:convert';

import 'package:dio/dio.dart';

class PokemonRepository {
  Future<void> getAllPokemon() async {
    try {
      final queryParameters = {'limit': 500, 'offset': 0};

      const url = 'https://pokeapi.co/api/v2/pokemon/';
      final Response<String> response = await Dio().get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        queryParameters: queryParameters,
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
      }
    } catch (_) {}
  }
}
