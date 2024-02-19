import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/src/core/constants/colors_type.dart';

class TypeIconWidget extends StatelessWidget {
  final dynamic pokemon;
  final double size;
  const TypeIconWidget({
    super.key,
    required this.pokemon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ColorsType().getColor(pokemon['type']['name']),
            blurRadius: 8,
            offset: const Offset(0.5, 2),
          ),
        ],
        color: ColorsType().getColor(pokemon['type']['name']),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        'assets/icons/${pokemon['type']['name']}.svg',
      ),
    );
  }
}
