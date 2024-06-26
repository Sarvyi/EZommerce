import 'package:ezom/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = TColors.white, this.margin,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: TColors.primary,
      padding: const EdgeInsets.all(0),
      child: Stack(children: [
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(400),
            color: TColors.textWhite.withOpacity(0.1),
          ),
        )
      ]),
    );
  }
}
