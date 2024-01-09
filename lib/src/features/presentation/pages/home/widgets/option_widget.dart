import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  final String title;
  final String route;
  final Function func;
  final String optionSelected;
  final bool isLoading;

  const OptionWidget({
    super.key,
    required this.route,
    required this.title,
    required this.func,
    required this.optionSelected,
    required this.isLoading,
  });

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onTapDown: (details) {
        widget.func(widget.title);
        Navigator.of(context).pushNamed(widget.route);
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black54.withOpacity(0.4),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 10),
              blurRadius: 5,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.optionSelected == widget.title
                  ? const Icon(Icons.arrow_forward_ios_rounded, size: 14)
                  : const Text('', style: TextStyle(fontSize: 14)),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
