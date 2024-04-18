import 'package:flutter/material.dart';
import '../screen/film_card.dart';

class SaveFilm extends StatelessWidget {
  SaveFilm({super.key, this.index, this.state});

  int? index;
  var state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
           // "${state.article1[index].urlToImage}",
            "${state.article1[index]}",
          ),
        ),
      ),
      //child: Text("${state.article1}"),
    );
  }
}