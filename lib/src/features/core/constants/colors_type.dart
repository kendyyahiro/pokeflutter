import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/core/enums/types_enum.dart';

class ColorsType {
  static Color normal = const Color(0xFFA8A878);
  static Color fighting = const Color(0xFFC03028);
  static Color flying = const Color(0xFFA890F0);
  static Color poison = const Color(0xFFA040A0);
  static Color ground = const Color(0xFFE0C068);
  static Color rock = const Color(0xFFB8A038);
  static Color bug = const Color(0xFFA8B820);
  static Color ghost = const Color(0xFF705898);
  static Color steel = const Color(0xFFB8B8D0);
  static Color stellar = const Color(0xFF7CC7B2);
  static Color fire = const Color(0xFFF08030);
  static Color water = const Color(0xFF6890F0);
  static Color grass = const Color(0xFF36BF36);
  static Color electric = const Color(0xFFF8D030);
  static Color psychic = const Color(0xFFF85888);
  static Color ice = const Color(0xFF98D8D8);
  static Color dragon = const Color(0xFF7038F8);
  static Color dark = const Color(0xFF705746);
  static Color fairy = const Color(0xFFEE99AC);
  static Color unknown = const Color(0xFFA8A878);

  Color getColor(type) {
    switch (type) {
      case 'normal':
        return ColorsType.normal;
      case 'fighting':
        return ColorsType.fighting;
      case 'flying':
        return ColorsType.flying;
      case 'poison':
        return ColorsType.poison;
      case 'ground':
        return ColorsType.ground;
      case 'rock':
        return ColorsType.rock;
      case 'bug':
        return ColorsType.bug;
      case 'ghost':
        return ColorsType.ghost;
      case 'steel':
        return ColorsType.steel;
      case 'stellar':
        return ColorsType.stellar;
      case 'fire':
        return ColorsType.fire;
      case 'water':
        return ColorsType.water;
      case 'grass':
        return ColorsType.grass;
      case 'electric':
        return ColorsType.electric;
      case 'psychic':
        return ColorsType.psychic;
      case 'ice':
        return ColorsType.ice;
      case 'dragon':
        return ColorsType.dragon;
      case 'dark':
        return ColorsType.dark;
      case 'fairy':
        return ColorsType.fairy;
      default:
        return ColorsType.unknown;
    }
  }
}
