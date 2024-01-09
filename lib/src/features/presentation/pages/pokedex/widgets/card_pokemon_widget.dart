import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex/widgets/image_svg_widget.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex/widgets/type_icon_widget.dart';

class CardPokemonWidget extends StatelessWidget {
  final String image;
  final dynamic pokemon;

  const CardPokemonWidget({
    super.key,
    required this.image,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              '#${pokemon['id']}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 8,
              ),
            ),
          ],
        ),
        ImageSvgWidget(image: image, width: 75, height: 75),
        const SizedBox(height: 12),
        Text(
          pokemon['name'].toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TypeIconWidget(
              size: 35,
              pokemon: pokemon['types'][0],
            ),
            if ((pokemon['types']).length > 1)
              TypeIconWidget(
                size: 35,
                pokemon: pokemon['types'][1],
              ),
          ],
        ),
      ],
    );
  }
}
