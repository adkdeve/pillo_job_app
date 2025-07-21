import 'package:flutter/material.dart';
import 'package:pcom_app/app/core/core.dart';

import 'my_text.dart';

class StarRatingComponent extends StatelessWidget {
  final List<int> ratings;

  const StarRatingComponent({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(ratings.length, (i) {
        final percentage = ratings[i] / 100;
        return Row(
          children: [
            MyText(
              text: '${(i - 5).abs()} star',
              fontSize: 14,
              color: R.theme.color900,
              fontWeight: FontWeight.w500,
            ),
            10.sbw,
            Expanded(
              child: LinearProgressIndicator(
                value: percentage,
                borderRadius: BorderRadius.circular(100),
                color: R.theme.selectedStar,
                backgroundColor: R.theme.unSelectedStar,
              ),
            ),
            10.sbw,
            SizedBox(
              width: 35,
              child: Text(
                ratings[i].toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      }),
      //  ratings.map((rating) {
      //   final percentage = rating / 100;
      //   return Row(
      //     children: [
      //       Text('$rating.index star', style: const TextStyle(fontSize: 16)),
      //       Expanded(
      //         child: LinearProgressIndicator(
      //           value: percentage,
      //           color: Colors.brown,
      //           backgroundColor: Colors.grey[300],
      //         ),
      //       ),
      //       Text(rating.toString(), style: const TextStyle(fontSize: 16)),
      //     ],
      //   );
      // }).toList(),
    );
  }
}
