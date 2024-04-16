import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../screen/film_card.dart';

class SaveFilm extends StatelessWidget {
  SaveFilm({super.key, this.index, this.saveState2});

  int? index;
  Box? saveState2;

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
            "${saveState2?.getAt(index!)}",
          ),
        ),
      ),
    );
  }
}
