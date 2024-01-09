import 'package:flutter/material.dart';

class ColorsType {
  static const Color normal = Color(0xFFA8A878);
  static const Color fighting = Color(0xFFC03028);
  static const Color flying = Color(0xFFA890F0);
  static const Color poison = Color(0xFFA040A0);
  static const Color ground = Color(0xFFE0C068);
  static const Color rock = Color(0xFFB8A038);
  static const Color bug = Color(0xFFA8B820);
  static const Color ghost = Color(0xFF705898);
  static const Color steel = Color(0xFFB8B8D0);
  static const Color stellar = Color(0xFF7CC7B2);
  static const Color fire = Color(0xFFF08030);
  static const Color water = Color(0xFF6890F0);
  static const Color grass = Color(0xFF36BF36);
  static const Color electric = Color(0xFFF8D030);
  static const Color psychic = Color(0xFFF85888);
  static const Color ice = Color(0xFF98D8D8);
  static const Color dragon = Color(0xFF7038F8);
  static const Color dark = Color(0xFF705746);
  static const Color fairy = Color(0xFFEE99AC);
  static const Color unknown = Color(0xFFA8A878);

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
