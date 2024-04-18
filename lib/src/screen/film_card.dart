import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/save_bloc/save_bloc.dart';
import '../bloc/save_bloc/save_event.dart';
import '../bloc/save_bloc/save_state.dart';
import '../components/articles_model.dart';

// late Box box;
// late Box box1;

class FilmCard extends StatefulWidget {
  const FilmCard({super.key, required this.article1});

  final Article article1;

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SaveBloc, SaveState>(
        builder: (context, state) => ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${widget.article1.urlToImage}"),
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
                "${widget.article1.description}",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // saveToHive(widget.article1);
                  context.read<SaveBloc>().add(
                        SaveDataEvent(
                          article1: widget.article1.urlToImage.toString(),
                        ),
                      );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Save"), Icon(Icons.download_rounded)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// void saveToHive(articles) async {
//
// box = await Hive.openBox("ImageDescription");
//
// box.add(articles.urlToImage);
// box1 = box;
//
// print("BoxValue${box.values}");
// print("BoxKey${box.keys}");
//
// }
