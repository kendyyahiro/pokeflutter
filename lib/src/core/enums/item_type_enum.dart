import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ItemTypeEnum {
  pokeball(
    true,
    'https://pokeapi.co/api/v2/item-pocket/3/',
    'Pokeballs',
    null,
  ),
  medicine(
    false,
    'https://pokeapi.co/api/v2/item-pocket/2/',
    'Medicine',
    FaIcon(
      FontAwesomeIcons.pumpMedical,
      color: Colors.black,
    ),
  ),
  stoneEvolutions(
    false,
    'https://pokeapi.co/api/v2/item-category/10/',
    'Evolutions',
    FaIcon(
      FontAwesomeIcons.atom,
      color: Colors.black,
    ),
  ),
  keys(
    false,
    'https://pokeapi.co/api/v2/item-category/20/',
    'Keys',
    FaIcon(
      FontAwesomeIcons.ticket,
      color: Colors.black,
    ),
  );

  final bool isPokeballs;
  final String url;
  final String name;
  final Widget? widget;

  const ItemTypeEnum(this.isPokeballs, this.url, this.name, this.widget);
}
