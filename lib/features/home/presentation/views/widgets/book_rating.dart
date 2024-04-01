import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, required this.averageRating, required this.ratingCount});

  final num averageRating;
  final num ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.solidStar,
            size: 16, color: Color(0xffFFDD4F)),
        const SizedBox(width: 6.5),
        Text("$averageRating", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            "($ratingCount)",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
