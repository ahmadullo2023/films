import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../bloc/save_bloc/save_bloc.dart';
import '../bloc/save_bloc/save_state.dart';
import '../widget/save_film.dart';

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<SaveBloc, SaveState>(builder: (context, state) {
          if (state.loading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return MasonryGridView.count(
            itemCount: state.article1?.length,
            padding: const EdgeInsets.symmetric(vertical: 20),
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return SaveFilm(index: index, state: state);
            },
          );
        }));
  }
}
