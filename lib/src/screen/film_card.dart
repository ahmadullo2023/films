import 'package:films/src/bloc/save_bloc/save_bloc.dart';
import 'package:films/src/bloc/save_bloc/save_event.dart';
import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:films/src/components/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

late Box box;
late Box box1;

class FilmCard extends StatefulWidget {
  const FilmCard({Key? key, this.article}) : super(key: key);

  final Articles? article;

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  late SaveBloc _saveBloc;

  @override
  void initState() {
    super.initState();
    _saveBloc = SaveBloc();
  }

  @override
  void dispose() {
    _saveBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider.value(
        value: _saveBloc,
        child: BlocBuilder<SaveBloc, SaveState>(
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
                        image: NetworkImage("${widget.article!.urlToImage}"),
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
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "${widget.article!.description}",
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SaveBloc>().add(
                      SaveDataEvent(
                        articles: widget.article ?? Articles(),
                      ),
                    );
                    print("stateeeeeeeeeeeeeee ${state.saveBox1}");
                    print("stateeeeeeeeeeeeeee ${state.saveBox2}");
                    print("imageeeeeeeeeeeeee ${widget.article?.urlToImage}");
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
      ),
    );
  }
}

