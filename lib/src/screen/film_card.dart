import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

 late Box box;
 late Box box1;

class FilmCard extends StatefulWidget {
  const FilmCard({super.key, this.article});

  final article;

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.article.urlToImage),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "${widget.article.description}",
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: (){
                saveToHive(widget.article);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Save"),
                  Icon(Icons.download_rounded)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



  void saveToHive(article) async {

  box = await Hive.openBox("ImageDescription");

  box.add(article.urlToImage);
  box1 = box;


  print("BoxValue${box.values}");
  print("BoxKey${box.keys}");

  }
