import 'package:flutter/material.dart';
import '../screen/film_card.dart';

class FilmsView extends StatefulWidget {
  const FilmsView({super.key, required this.articles});

  final articles;

  @override
  State<FilmsView> createState() => _FilmsViewState();
}

class _FilmsViewState extends State<FilmsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FilmCard(article1: widget.articles),
                ),
              );
            },
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("${widget.articles?.urlToImage}"),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            )));
  }
}
