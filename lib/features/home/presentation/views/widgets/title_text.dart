import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, left: 20,bottom: 10),
      child: Text(
        "Newest Books",
        style: Styles.textStyle18,
      ),
    );
  }
}