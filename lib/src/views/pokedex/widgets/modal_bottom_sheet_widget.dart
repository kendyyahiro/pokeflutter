import 'package:flutter/material.dart';
import 'package:pokeflutter/src/core/constants/colors_type.dart';
import 'package:pokeflutter/src/views/pokedex/widgets/group_attributes_widget.dart';
import 'package:pokeflutter/src/views/pokedex/widgets/image_svg_widget.dart';
import 'package:pokeflutter/src/views/pokedex/widgets/type_icon_widget.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  final dynamic pokemon;
  final String image;

  const ModalBottomSheetWidget({
    super.key,
    required this.pokemon,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 1),
            colors: <Color>[
              ColorsType().getColor(pokemon['types'][0]['type']['name']),
              ColorsType().getColor(pokemon['types']
                  [pokemon['types'].length > 1 ? 1 : 0]['type']['name']),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20),
                ImageSvgWidget(image: image, width: 90, height: 200),
                const SizedBox(height: 40),
                Text(
                  pokemon['name'].toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TypeIconWidget(
                      size: 50,
                      pokemon: pokemon['types'][0],
                    ),
                    if ((pokemon['types']).length > 1)
                      TypeIconWidget(
                        size: 50,
                        pokemon: pokemon['types'][1],
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                GroupAttributesWidget(states: pokemon['stats']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
