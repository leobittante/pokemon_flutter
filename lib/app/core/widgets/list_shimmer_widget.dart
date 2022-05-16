import 'package:flutter/material.dart';
import 'package:pokemon_dex/app/core/widgets/shimmer_card.dart';

class ListShimmer extends StatelessWidget {
  final double? height;
  const ListShimmer({Key? key, this.height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              SizedBox(
                height: height,
              ), //
            ShimmerCard(index: index),
          ],
        );
      },
    );
  }
}
