import 'package:flutter/material.dart';
import 'package:pokeflutter/src/core/constants/colors_type.dart';
import 'package:pokeflutter/src/core/constants/icons_type.dart';

enum PokemonFilterEnum {
  all(Colors.black26, null, 'all'),
  normal(ColorsType.normal, PokemonTypesEnum.normal, 'normal'),
  fighting(ColorsType.fighting, PokemonTypesEnum.fighting, 'fighting'),
  flying(ColorsType.flying, PokemonTypesEnum.flying, 'flying'),
  poison(ColorsType.poison, PokemonTypesEnum.poison, 'poison'),
  ground(ColorsType.ground, PokemonTypesEnum.ground, 'ground'),
  rock(ColorsType.rock, PokemonTypesEnum.rock, 'rock'),
  bug(ColorsType.bug, PokemonTypesEnum.bug, 'bug'),
  ghost(ColorsType.ghost, PokemonTypesEnum.ghost, 'ghost'),
  steel(ColorsType.steel, PokemonTypesEnum.steel, 'steel'),
  stellar(ColorsType.stellar, PokemonTypesEnum.stellar, 'stellar'),
  fire(ColorsType.fire, PokemonTypesEnum.fire, 'fire'),
  water(ColorsType.water, PokemonTypesEnum.water, 'water'),
  grass(ColorsType.grass, PokemonTypesEnum.grass, 'grass'),
  electric(ColorsType.electric, PokemonTypesEnum.electric, 'electric'),
  psychic(ColorsType.psychic, PokemonTypesEnum.psychic, 'psychic'),
  ice(ColorsType.ice, PokemonTypesEnum.ice, 'ice'),
  dragon(ColorsType.dragon, PokemonTypesEnum.dragon, 'dragon'),
  dark(ColorsType.dark, PokemonTypesEnum.dark, 'dark'),
  fairy(ColorsType.fairy, PokemonTypesEnum.fairy, 'fairy');

  final PokemonTypesEnum? type;
  final String name;
  final Color color;

  const PokemonFilterEnum(this.color, this.type, this.name);
}

enum PokemonTypesEnum {
  normal(IconsType.normal),
  fighting(IconsType.fighting),
  flying(IconsType.flying),
  poison(IconsType.poison),
  ground(IconsType.ground),
  rock(IconsType.rock),
  bug(IconsType.bug),
  ghost(IconsType.ghost),
  steel(IconsType.steel),
  stellar(IconsType.stellar),
  fire(IconsType.fire),
  water(IconsType.water),
  grass(IconsType.grass),
  electric(IconsType.electric),
  psychic(IconsType.psychic),
  ice(IconsType.ice),
  dragon(IconsType.dragon),
  dark(IconsType.dark),
  fairy(IconsType.fairy);

  final String icon;
  const PokemonTypesEnum(this.icon);
}

extension PokemonTypesEnumExtension on PokemonTypesEnum {
  Color get color {
    switch (this) {
      case PokemonTypesEnum.normal:
        return ColorsType.normal;
      case PokemonTypesEnum.fighting:
        return ColorsType.fighting;
      case PokemonTypesEnum.flying:
        return ColorsType.flying;
      case PokemonTypesEnum.poison:
        return ColorsType.poison;
      case PokemonTypesEnum.ground:
        return ColorsType.ground;
      case PokemonTypesEnum.rock:
        return ColorsType.rock;
      case PokemonTypesEnum.bug:
        return ColorsType.bug;
      case PokemonTypesEnum.ghost:
        return ColorsType.ghost;
      case PokemonTypesEnum.steel:
        return ColorsType.steel;
      case PokemonTypesEnum.stellar:
        return ColorsType.stellar;
      case PokemonTypesEnum.fire:
        return ColorsType.fire;
      case PokemonTypesEnum.water:
        return ColorsType.water;
      case PokemonTypesEnum.grass:
        return ColorsType.grass;
      case PokemonTypesEnum.electric:
        return ColorsType.electric;
      case PokemonTypesEnum.psychic:
        return ColorsType.psychic;
      case PokemonTypesEnum.ice:
        return ColorsType.ice;
      case PokemonTypesEnum.dragon:
        return ColorsType.dragon;
      case PokemonTypesEnum.dark:
        return ColorsType.dark;
      default:
        return ColorsType.fairy;
    }
  }

  String get iconSVG {
    switch (this) {
      case PokemonTypesEnum.normal:
        return IconsType.normal;
      case PokemonTypesEnum.fighting:
        return IconsType.fighting;
      case PokemonTypesEnum.flying:
        return IconsType.flying;
      case PokemonTypesEnum.poison:
        return IconsType.poison;
      case PokemonTypesEnum.ground:
        return IconsType.ground;
      case PokemonTypesEnum.rock:
        return IconsType.rock;
      case PokemonTypesEnum.bug:
        return IconsType.bug;
      case PokemonTypesEnum.ghost:
        return IconsType.ghost;
      case PokemonTypesEnum.steel:
        return IconsType.steel;
      case PokemonTypesEnum.stellar:
        return IconsType.stellar;
      case PokemonTypesEnum.fire:
        return IconsType.fire;
      case PokemonTypesEnum.water:
        return IconsType.water;
      case PokemonTypesEnum.grass:
        return IconsType.grass;
      case PokemonTypesEnum.electric:
        return IconsType.electric;
      case PokemonTypesEnum.psychic:
        return IconsType.psychic;
      case PokemonTypesEnum.ice:
        return IconsType.ice;
      case PokemonTypesEnum.dragon:
        return IconsType.dragon;
      case PokemonTypesEnum.dark:
        return IconsType.dark;
      default:
        return IconsType.fairy;
    }
  }
}
