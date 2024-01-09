import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSvgWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const ImageSvgWidget({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (image != '')
          SvgPicture.network(
            image,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        if (image == '')
          SvgPicture.asset(
            'assets/question-mark.svg',
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
      ],
    );
  }
}
