import 'package:pokeflutter/src/features/core/enums/pokemon_types_enum.dart';

class IconsType {
  static const String normal = 'assets/icons/normal.svg';
  static const String fighting = 'assets/icons/fighting.svg';
  static const String flying = 'assets/icons/flying.svg';
  static const String poison = 'assets/icons/poison.svg';
  static const String ground = 'assets/icons/ground.svg';
  static const String rock = 'assets/icons/rock.svg';
  static const String bug = 'assets/icons/bug.svg';
  static const String ghost = 'assets/icons/ghost.svg';
  static const String steel = 'assets/icons/steel.svg';
  static const String stellar = 'assets/icons/stellar.svg';
  static const String fire = 'assets/icons/fire.svg';
  static const String water = 'assets/icons/water.svg';
  static const String grass = 'assets/icons/grass.svg';
  static const String electric = 'assets/icons/electric.svg';
  static const String psychic = 'assets/icons/psychic.svg';
  static const String ice = 'assets/icons/ice.svg';
  static const String dragon = 'assets/icons/dragon.svg';
  static const String dark = 'assets/icons/dark.svg';
  static const String fairy = 'assets/icons/fairy.svg';

  String getIcon(type) {
    switch (type) {
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
