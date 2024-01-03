import 'package:pokeflutter/src/features/core/enums/types_enum.dart';

class IconsType {
  static String normal = 'assets/icons/normal.svg';
  static String fighting = 'assets/icons/fighting.svg';
  static String flying = 'assets/icons/flying.svg';
  static String poison = 'assets/icons/poison.svg';
  static String ground = 'assets/icons/ground.svg';
  static String rock = 'assets/icons/rock.svg';
  static String bug = 'assets/icons/bug.svg';
  static String ghost = 'assets/icons/ghost.svg';
  static String steel = 'assets/icons/steel.svg';
  static String stellar = 'assets/icons/stellar.svg';
  static String fire = 'assets/icons/fire.svg';
  static String water = 'assets/icons/water.svg';
  static String grass = 'assets/icons/grass.svg';
  static String electric = 'assets/icons/electric.svg';
  static String psychic = 'assets/icons/psychic.svg';
  static String ice = 'assets/icons/ice.svg';
  static String dragon = 'assets/icons/dragon.svg';
  static String dark = 'assets/icons/dark.svg';
  static String fairy = 'assets/icons/fairy.svg';

  String getIcon(type) {
    switch (type) {
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
