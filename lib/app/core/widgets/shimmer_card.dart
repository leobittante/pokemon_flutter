import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class ShimmerCard extends StatelessWidget {
  final int index;
  const ShimmerCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 14),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        height: size.height * .115,
        child: Shimmer.fromColors(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: colorForIndex(index, context),
            ),
          ),
          baseColor: colorForIndex(index, context),
          highlightColor: Colors.white38,
        ),
      ),
    );
  }

  Color colorForHighLightIndex(int index) {
    Color color = AppColors.defaultPurple;
    if (index.floor().isEven) {
      color = Colors.white10;
    } else {
      color = Colors.white38;
    }
    return color;
  }

  Color colorForIndex(int index, BuildContext context) {
    Color color = AppColors.defaultPurple;
    if (index.floor().isEven) {
      color = AppColors.defaultPurple;
    } else {
      color = Theme.of(context).colorScheme.primary;
    }
    return color;
  }
}
