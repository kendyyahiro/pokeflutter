import 'package:flutter/material.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
      child: InkWell(
        onTap: () => {Navigator.pop(context)},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black54.withOpacity(0.4),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Colors.black87,
              ),
              Text(
                'Press B',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ), //
            ],
          ),
        ),
      ),
    );
  }
}
