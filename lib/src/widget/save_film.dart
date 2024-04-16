import 'package:flutter/material.dart';

import '../screen/film_card.dart';

class SaveFilm extends StatelessWidget {
  SaveFilm({super.key, this.index});

  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "${box1.getAt(index!)}",
          ),
        ),
      ),
    );
  }
}
