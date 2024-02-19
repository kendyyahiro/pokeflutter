import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/src/core/constants/string_function.dart';

class ItemWidget extends StatelessWidget {
  final List<dynamic>? items;
  const ItemWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return items == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            separatorBuilder: (_, index) =>
                const Divider(color: Colors.black54),
            itemCount: items?.length ?? 0,
            itemBuilder: (_, index) {
              return Center(
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  leading: items![index]['sprites']['default'] != null
                      ? Image.network(
                          items![index]['sprites']['default'],
                        )
                      : SvgPicture.asset(
                          'assets/question-mark.svg',
                          fit: BoxFit.contain,
                          height: 28,
                          width: 28,
                        ),
                  title: Text(
                    StringFunction()
                        .allFirstCharacterUppercase(items![index]['name']),
                    style: const TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  subtitle: Text(
                    items![index]['effect_entries'].length > 0
                        ? "${items![index]['effect_entries'][0]?['short_effect']}"
                        : "",
                    style: const TextStyle(
                        fontSize: 8,
                        letterSpacing: 2,
                        height: 1.75 //You can set your custom height here
                        ),
                  ),
                ),
              );
            },
          );
  }
}
