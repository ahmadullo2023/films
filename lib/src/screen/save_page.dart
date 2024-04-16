import 'package:films/src/bloc/save_bloc/save_bloc.dart';
import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:films/src/screen/film_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widget/save_film.dart';


class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SaveBloc, SaveState>(
        bloc: SaveBloc(),
        builder: (context, state) {
          print("dataaaaaaaaaa ${state.saveBox2?.length}");
          print("dataaaaaaaaaa ${state.saveBox2}");
          return MasonryGridView.count(
          itemCount: state.saveBox2?.length ?? 0,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return SaveFilm(
              index: index,
              saveState2: state.saveBox2,
            );
          },
        );
        },
      ),
    );
  }
}
