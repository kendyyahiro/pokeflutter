// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokeflutter/src/core/enums/pokemon_types_enum.dart';

class PokemonModel {
  String name;
  String url;
  int order;
  List<PokemonTypesEnum> types;
  String dreamWorld;

  PokemonModel({
    required this.name,
    required this.url,
    required this.order,
    required this.types,
    required this.dreamWorld,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'order': order,
    };
  }

  Map<dynamic, dynamic> toMapExternal() {
    return <dynamic, dynamic>{
      'name': name,
      'order': order,
      'url': url,
      'image': dreamWorld,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] as String,
      url: map['url'] as String,
      order: map['order'] as int,
      types: map['types'] as List<PokemonTypesEnum>,
      dreamWorld: map['dreamWorld'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
