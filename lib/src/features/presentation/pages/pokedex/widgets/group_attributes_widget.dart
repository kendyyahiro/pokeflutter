import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/presentation/pages/pokedex/widgets/attribute_widget.dart';

class GroupAttributesWidget extends StatelessWidget {
  final dynamic states;
  const GroupAttributesWidget({
    super.key,
    required this.states,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AttributeWidget(
          name: 'HP',
          attribute: states[0],
        ),
        const SizedBox(height: 10),
        AttributeWidget(
          name: 'ATK',
          attribute: states[1],
        ),
        const SizedBox(height: 10),
        AttributeWidget(
          name: 'DEF',
          attribute: states[2],
        ),
        const SizedBox(height: 10),
        AttributeWidget(
          name: 'SP. ATK',
          attribute: states[3],
        ),
        const SizedBox(height: 10),
        AttributeWidget(
          name: 'SP. DEF',
          attribute: states[4],
        ),
        const SizedBox(height: 10),
        AttributeWidget(
          name: 'SPEED',
          attribute: states[5],
        )
      ],
    );
  }
}
