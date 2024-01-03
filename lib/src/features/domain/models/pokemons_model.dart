// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokeflutter/src/features/domain/models/pokemon_model.dart';

class PokemonsModel {
  final List<PokemonModel> results;

  PokemonsModel({
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonsModel.fromMap(Map<String, dynamic> map) {
    return PokemonsModel(
      results: List<PokemonModel>.from(
        (map['results'] as List<int>).map<PokemonModel>(
          (x) => PokemonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory PokemonsModel.fromMapList(List<dynamic> list) {
    return PokemonsModel(
      results: List<PokemonModel>.from(
        list.map<PokemonModel>(
          (dynamic x) => PokemonModel.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsModel.fromJson(String source) =>
      PokemonsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
