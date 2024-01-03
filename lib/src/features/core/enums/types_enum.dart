import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/core/constants/colors_type.dart';
import 'package:pokeflutter/src/features/core/constants/icons_type.dart';

enum TypesEnum {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  stellar,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
}

extension TypesEnumExtension on TypesEnum {
  Color get color {
    switch (this) {
      case TypesEnum.normal:
        return ColorsType.normal;
      case TypesEnum.fighting:
        return ColorsType.fighting;
      case TypesEnum.flying:
        return ColorsType.flying;
      case TypesEnum.poison:
        return ColorsType.poison;
      case TypesEnum.ground:
        return ColorsType.ground;
      case TypesEnum.rock:
        return ColorsType.rock;
      case TypesEnum.bug:
        return ColorsType.bug;
      case TypesEnum.ghost:
        return ColorsType.ghost;
      case TypesEnum.steel:
        return ColorsType.steel;
      case TypesEnum.stellar:
        return ColorsType.stellar;
      case TypesEnum.fire:
        return ColorsType.fire;
      case TypesEnum.water:
        return ColorsType.water;
      case TypesEnum.grass:
        return ColorsType.grass;
      case TypesEnum.electric:
        return ColorsType.electric;
      case TypesEnum.psychic:
        return ColorsType.psychic;
      case TypesEnum.ice:
        return ColorsType.ice;
      case TypesEnum.dragon:
        return ColorsType.dragon;
      case TypesEnum.dark:
        return ColorsType.dark;
      default:
        return ColorsType.fairy;
    }
  }

  String get iconSVG {
    switch (this) {
      case TypesEnum.normal:
        return IconsType.normal;
      case TypesEnum.fighting:
        return IconsType.fighting;
      case TypesEnum.flying:
        return IconsType.flying;
      case TypesEnum.poison:
        return IconsType.poison;
      case TypesEnum.ground:
        return IconsType.ground;
      case TypesEnum.rock:
        return IconsType.rock;
      case TypesEnum.bug:
        return IconsType.bug;
      case TypesEnum.ghost:
        return IconsType.ghost;
      case TypesEnum.steel:
        return IconsType.steel;
      case TypesEnum.stellar:
        return IconsType.stellar;
      case TypesEnum.fire:
        return IconsType.fire;
      case TypesEnum.water:
        return IconsType.water;
      case TypesEnum.grass:
        return IconsType.grass;
      case TypesEnum.electric:
        return IconsType.electric;
      case TypesEnum.psychic:
        return IconsType.psychic;
      case TypesEnum.ice:
        return IconsType.ice;
      case TypesEnum.dragon:
        return IconsType.dragon;
      case TypesEnum.dark:
        return IconsType.dark;
      default:
        return IconsType.fairy;
    }
  }
}
