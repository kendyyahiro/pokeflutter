import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatelessWidget {
  final String titlePage;

  const AppBarCustomWidget({
    super.key,
    required this.titlePage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: Colors.black87,
                ),
                label: const Text(
                  'Press B',
                  style: TextStyle(fontSize: 8, color: Colors.black87),
                ), // <-- Text
              ),
              Text(
                titlePage,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
